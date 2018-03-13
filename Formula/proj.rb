class Proj < Formula
  desc "Cartographic Projections Library"
  homepage "http://proj4.org/"
  url "https://download.osgeo.org/proj/proj-5.0.0.tar.gz"
  sha256 "b30df08d736e69744cb255828721abb545b494d6032c13a96520f3219a444cd2"
  revision 1

  bottle do
    sha256 "a37b9d73873c3a72fe4097724f093568b8d7b71c9b2075283fef4318f809df24" => :high_sierra
    sha256 "4dfe23e5d9f160efdbbdc99429574276deebbfc9e303987a6a9b70239ac5c60a" => :sierra
    sha256 "6ad68353870e17425622554183939725545b7f2923b485b9664559a9d4b66f82" => :el_capitan
    sha256 "0cbfa2756bc8c36759acbc4bc3de8900345369d9399ec0fcb97798f5538215a4" => :x86_64_linux
  end

  head do
    url "https://github.com/OSGeo/proj.4.git"
    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
  end

  option "with-vdatum", "Install vertical datum files (~380 MB)"

  # The datum grid files are required to support datum shifting
  resource "datumgrid" do
    url "https://download.osgeo.org/proj/proj-datumgrid-1.7.zip"
    sha256 "ffcad4453fac3b4a13ca678ef343e688496e18019f35709ef03c5f200e9fb85a"
  end

  # Vertical datum files
  resource "usa_geoid2012" do
    url "https://download.osgeo.org/proj/vdatum/usa_geoid2012.zip"
    sha256 "afe49dc2c405d19a467ec756483944a3c9148e8c1460cb7e82dc8d4a64c4c472"
  end

  resource "usa_geoid2009" do
    url "https://download.osgeo.org/proj/vdatum/usa_geoid2009.zip"
    sha256 "1a232fb7fe34d2dad2d48872025597ac7696882755ded1493118a573f60008b1"
  end

  resource "usa_geoid2003" do
    url "https://download.osgeo.org/proj/vdatum/usa_geoid2003.zip"
    sha256 "1d15950f46e96e422ebc9202c24aadec221774587b7a4cd963c63f8837421351"
  end

  resource "usa_geoid1999" do
    url "https://download.osgeo.org/proj/vdatum/usa_geoid1999.zip"
    sha256 "665cd4dfc991f2517752f9db84d632b56bba31a1ed6a5f0dc397e4b0b3311f36"
  end

  resource "vertconc" do
    url "https://download.osgeo.org/proj/vdatum/vertcon/vertconc.gtx"
    sha256 "ecf7bce7bf9e56f6f79a2356d8d6b20b9cb49743701f81db802d979b5a01fcff"
  end

  resource "vertcone" do
    url "https://download.osgeo.org/proj/vdatum/vertcon/vertcone.gtx"
    sha256 "f6da1c615c2682ecb7adcfdf22b1d37aba2771c2ea00abe8907acea07413903b"
  end

  resource "vertconw" do
    url "https://download.osgeo.org/proj/vdatum/vertcon/vertconw.gtx"
    sha256 "de648c0f6e8b5ebfc4b2d82f056c7b993ca3c37373a7f6b7844fe9bd4871821b"
  end

  resource "egm08_25" do
    url "https://download.osgeo.org/proj/vdatum/egm08_25/egm08_25.gtx"
    sha256 "c18f20d1fe88616e3497a3eff993227371e1d9acc76f96253e8d84b475bbe6bf"
  end

  skip_clean :la

  def install
    resources.each do |r|
      if r.name == "datumgrid"
        (buildpath/"nad").install r
      elsif build.with? "vdatum"
        pkgshare.install r
      end
    end

    system "./autogen.sh" if build.head?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    (testpath/"test").write <<~EOS
      45d15n 71d07w Boston, United States
      40d40n 73d58w New York, United States
      48d51n 2d20e Paris, France
      51d30n 7'w London, England
    EOS
    match = <<~EOS
      -4887590.49\t7317961.48 Boston, United States
      -5542524.55\t6982689.05 New York, United States
      171224.94\t5415352.81 Paris, France
      -8101.66\t5707500.23 London, England
    EOS
    assert_equal match,
                 `#{bin}/proj +proj=poly +ellps=clrk66 -r #{testpath}/test`
  end
end
