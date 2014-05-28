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
end
