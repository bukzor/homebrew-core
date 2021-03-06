class Libunistring < Formula
  desc "C string library for manipulating Unicode strings"
  homepage "https://www.gnu.org/software/libunistring/"
  url "https://ftp.gnu.org/gnu/libunistring/libunistring-0.9.8.tar.xz"
  mirror "https://ftpmirror.gnu.org/libunistring/libunistring-0.9.8.tar.xz"
  sha256 "7b9338cf52706facb2e18587dceda2fbc4a2a3519efa1e15a3f2a68193942f80"

  bottle do
    cellar :any
    sha256 "ccc4789699aed620a7f961549e9888a77df38e608cfcff60b5d59b292b9807dc" => :high_sierra
    sha256 "b685813e92dbd3a4eedcaac4b1a87ee3aae00a2dd4cf49cfc8d03cde079fac16" => :sierra
    sha256 "ef72051cb81989e396175cbbf82cde4c62bf8dbb1ef3028c4658af6402ad6133" => :el_capitan
    sha256 "dae91fe667b1d278cb0c69f508e220bf6d68b2a4419c5ffdaca0ee0378d6b149" => :x86_64_linux
  end

  # Fix crash from usage of %n in dynamic format strings on High Sierra
  # Repurposed patch, credit to Jeremy Huddleston Sequoia <jeremyhu@apple.com>
  if MacOS.version >= :high_sierra
    patch :p0 do
      url "https://raw.githubusercontent.com/macports/macports-ports/edf0ee1e2cf/devel/m4/files/secure_snprintf.patch"
      sha256 "57f972940a10d448efbd3d5ba46e65979ae4eea93681a85e1d998060b356e0d2"
    end
  end

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "check"
    system "make", "install"
  end

  test do
    (testpath/"test.c").write <<~EOS
      #include <uniname.h>
      #include <unistdio.h>
      #include <stdio.h>
      #include <stdlib.h>
      int main (void) {
        uint32_t s[2] = {};
        uint8_t buff[12] = {};
        if (u32_uctomb (s, unicode_name_character ("BEER MUG"), sizeof s) != 1) abort();
        if (u8_sprintf (buff, "%llU", s) != 4) abort();
        printf ("%s\\n", buff);
        return 0;
      }
    EOS
    system ENV.cc, "test.c", "-I#{include}", "-L#{lib}", "-lunistring",
                   "-o", "test"
    assert_equal "🍺", shell_output("./test").chomp
  end
end
