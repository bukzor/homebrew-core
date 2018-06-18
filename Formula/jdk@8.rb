class JdkAT8 < Formula
  desc "Java Platform, Standard Edition Development Kit (JDK)"
  homepage "http://www.oracle.com/technetwork/java/javase/downloads/index.html"
  # tag "linuxbrew"

  version "1.8.0-162"
  if OS.linux?
    url "http://ftp.osuosl.org/pub/funtoo/distfiles/oracle-java/jdk-8u162-linux-x64.tar.gz"
    sha256 "68ec82d47fd9c2b8eb84225b6db398a72008285fafc98631b1ff8d2229680257"
  elsif OS.mac?
    url "http://java.com/"
  end

  bottle do
    cellar :any_skip_relocation
    sha256 "5055f79e8b7048e0fd27795131599aa440b195edbb02425dcd7f9171308720d5" => :x86_64_linux
  end

  keg_only :versioned_formula

  def install
    odie "Use 'brew cask install java' on Mac OS" if OS.mac?
    prefix.install Dir["*"]
    share.mkdir
    share.install prefix/"man"
  end

  def caveats; <<~EOS
    By installing and using JDK you agree to the
    Oracle Binary Code License Agreement for the Java SE Platform Products and JavaFX
    http://www.oracle.com/technetwork/java/javase/terms/license/index.html
  EOS
  end

  test do
    (testpath/"Hello.java").write <<~EOS
      class Hello
      {
        public static void main(String[] args)
        {
          System.out.println("Hello Homebrew");
        }
      }
    EOS
    system bin/"javac", "Hello.java"
    assert_predicate testpath/"Hello.class", :exist?, "Failed to compile Java program!"
    assert_equal "Hello Homebrew\n", shell_output("#{bin}/java Hello")
  end
end
