class SphinxDoc < Formula
  desc "Tool to create intelligent and beautiful documentation"
  homepage "http://sphinx-doc.org"
  url "https://files.pythonhosted.org/packages/a7/58/27176960f2509d94d433efedc2b910315bb892fcacf4bde0242074977c2e/Sphinx-1.6.7.tar.gz"
  sha256 "832bed0dc6099c2abca957d90ff55bc1a6ec4425c13fc144adbae68a970e3775"
  revision 1

  bottle do
    cellar :any_skip_relocation
    sha256 "009cb3d55cb5b11c1270f6b1ad7960fb9bbd8372a72707a66d6984c26aeee235" => :high_sierra
    sha256 "9419475eedb3d52636fe26bc801ec6bf653287da2e4cd4ed6049ffe14263f902" => :sierra
    sha256 "4d0dc7de7d2bab809ffd05c6bf6e3df9ada66682573d96c727490291d9d14bbf" => :el_capitan
    sha256 "6e34d8a5f02284e0eb1ae728f7fc4685c371bb3ea9e6a558e7685382591a0ef3" => :x86_64_linux
  end

  keg_only <<~EOS
    this formula is mainly used internally by other formulae.
    Users are advised to use `pip` to install sphinx-doc
  EOS

  depends_on "python" if OS.mac? && MacOS.version <= :snow_leopard || !OS.mac?

  # generated from sphinx, setuptools, and numpydoc
  resource "setuptools" do
    url "https://files.pythonhosted.org/packages/6c/54/f7e9cea6897636a04e74c3954f0d8335cc38f7d01e27eec98026b049a300/setuptools-38.5.1.zip"
    sha256 "6425484c08e99a98a42209c25c3d325f749230b55284d66192784f941a7e6628"
  end

  resource "alabaster" do
    url "https://files.pythonhosted.org/packages/d0/a5/e3a9ad3ee86aceeff71908ae562580643b955ea1b1d4f08ed6f7e8396bd7/alabaster-0.7.10.tar.gz"
    sha256 "37cdcb9e9954ed60912ebc1ca12a9d12178c26637abdf124e3cde2341c257fe0"
  end

  resource "Babel" do
    url "https://files.pythonhosted.org/packages/0e/d5/9b1d6a79c975d0e9a32bd337a1465518c2519b14b214682ca9892752417e/Babel-2.5.3.tar.gz"
    sha256 "8ce4cb6fdd4393edd323227cba3a077bceb2a6ce5201c902c65e730046f41f14"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/15/d4/2f888fc463d516ff7bf2379a4e9a552fef7f22a94147655d9b1097108248/certifi-2018.1.18.tar.gz"
    sha256 "edbc3f203427eef571f79a7692bb160a2b0f7ccaa31953e99bd17e307cf63f7d"
  end

  resource "chardet" do
    url "https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz"
    sha256 "84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae"
  end

  resource "docutils" do
    url "https://files.pythonhosted.org/packages/84/f4/5771e41fdf52aabebbadecc9381d11dea0fa34e4759b4071244fa094804c/docutils-0.14.tar.gz"
    sha256 "51e64ef2ebfb29cae1faa133b3710143496eca21c530f3f71424d77687764274"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/f4/bd/0467d62790828c23c47fc1dfa1b1f052b24efdf5290f071c7a91d0d82fd3/idna-2.6.tar.gz"
    sha256 "2c6a5de3089009e3da7c5dde64a141dbc8551d5b7f6cf4ed7c2568d0cc520a8f"
  end

  resource "imagesize" do
    url "https://files.pythonhosted.org/packages/53/72/6c6f1e787d9cab2cc733cf042f125abec07209a58308831c9f292504e826/imagesize-0.7.1.tar.gz"
    sha256 "0ab2c62b87987e3252f89d30b7cedbec12a01af9274af9ffa48108f2c13c6062"
  end

  resource "Jinja2" do
    url "https://files.pythonhosted.org/packages/56/e6/332789f295cf22308386cf5bbd1f4e00ed11484299c5d7383378cf48ba47/Jinja2-2.10.tar.gz"
    sha256 "f84be1bb0040caca4cea721fcbbbbd61f9be9464ca236387158b0feea01914a4"
  end

  resource "MarkupSafe" do
    url "https://files.pythonhosted.org/packages/4d/de/32d741db316d8fdb7680822dd37001ef7a448255de9699ab4bfcbdf4172b/MarkupSafe-1.0.tar.gz"
    sha256 "a6be69091dac236ea9c6bc7d012beab42010fa914c459791d627dad4910eb665"
  end

  resource "numpydoc" do
    url "https://files.pythonhosted.org/packages/21/94/0e087bd669bb69da3b0996acfee97cee9f7d91c825991ad76eb863dc020d/numpydoc-0.7.0.tar.gz"
    sha256 "2dc7b2c4e3914745e38e370946fa4c109817331e6d450806285c08bce5cd575a"
  end

  resource "Pygments" do
    url "https://files.pythonhosted.org/packages/71/2a/2e4e77803a8bd6408a2903340ac498cb0a2181811af7c9ec92cb70b0308a/Pygments-2.2.0.tar.gz"
    sha256 "dbae1046def0efb574852fab9e90209b23f556367b5a320c0bcb871c77c3e8cc"
  end

  resource "pytz" do
    url "https://files.pythonhosted.org/packages/1b/50/4cdc62fc0753595fc16c8f722a89740f487c6e5670c644eb8983946777be/pytz-2018.3.tar.gz"
    sha256 "410bcd1d6409026fbaa65d9ed33bf6dd8b1e94a499e32168acfc7b332e4095c0"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/b0/e1/eab4fc3752e3d240468a8c0b284607899d2fbfb236a56b7377a329aa8d09/requests-2.18.4.tar.gz"
    sha256 "9c443e7324ba5b85070c4a818ade28bfabedf16ea10206da1132edaa6dda237e"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz"
    sha256 "70e8a77beed4562e7f14fe23a786b54f6296e34344c23bc42f07b15018ff98e9"
  end

  resource "snowballstemmer" do
    url "https://files.pythonhosted.org/packages/20/6b/d2a7cb176d4d664d94a6debf52cd8dbae1f7203c8e42426daa077051d59c/snowballstemmer-1.2.1.tar.gz"
    sha256 "919f26a68b2c17a7634da993d91339e288964f93c274f1343e3bbbe2096e1128"
  end

  resource "sphinxcontrib-websupport" do
    url "https://files.pythonhosted.org/packages/c5/6b/f0630436b931ad4f8331a9399ca18a7d447f0fcc0c7178fb56b1aee68d01/sphinxcontrib-websupport-1.0.1.tar.gz"
    sha256 "7a85961326aa3a400cd4ad3c816d70ed6f7c740acd7ce5d78cd0a67825072eb9"
  end

  resource "typing" do
    url "https://files.pythonhosted.org/packages/ec/cc/28444132a25c113149cec54618abc909596f0b272a74c55bab9593f8876c/typing-3.6.4.tar.gz"
    sha256 "d400a9344254803a2368533e4533a4200d21eb7b6b729c173bc38201a74db3f2"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/ee/11/7c59620aceedcc1ef65e156cc5ce5a24ef87be4107c2b74458464e437a5d/urllib3-1.22.tar.gz"
    sha256 "cc44da8e1145637334317feebd728bd869a35285b93cbb4cca2577da7e62db4f"
  end

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
    resources.each do |r|
      r.stage do
        system "python", *Language::Python.setup_install_args(libexec/"vendor")
      end
    end

    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
    system "python", *Language::Python.setup_install_args(libexec)

    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end

  def post_install
    return if OS.mac?
    python = HOMEBREW_PREFIX/"bin/python"
    python = "/usr/bin/env python" unless python.executable?
    inreplace Dir[libexec/"bin/*"], %r{^#!.*bin/python$}, "#!#{python}"
  end

  test do
    system bin/"sphinx-quickstart", "-pPorject", "-aAuthor", "-v1.0", "-q"
    system bin/"sphinx-build", testpath, testpath/"build"
    assert_predicate testpath/"build/index.html", :exist?
  end
end
