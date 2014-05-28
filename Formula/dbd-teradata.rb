require "formula"

class DbdTeradata < Formula
  homepage "http://www.presicient.com/tdatdbd/"
  url "http://www.presicient.com/tdatdbd/DBD-Teradata-12.001.tar.gz"
  sha1 "e206b0b07bcb6d20d7bf32dbffe5ff8812679ca6"

  depends_on 'Crypt::ECB' => :perl
  depends_on 'Crypt::Rijndael' => :perl
  depends_on 'Digest::SHA1' => :perl

  def install
    Dir.chdir("DBD-Teradata-12.001")

    system "perl", "Makefile.PL"
    system "make"
    system "sudo", "make", "install"
  end

  def caveats

      s = <<-EOS.undent
        THIS FORMULA REQUIRES SUDO. Mainly because if it didn't, then you would
        have to make a few modifications to your perl install, and ain't nobody
        got time fo dat.
      EOS
      s
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test DBD-Teradata`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
