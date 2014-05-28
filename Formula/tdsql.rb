require "formula"

# Documentation: https://github.com/Homebrew/homebrew/wiki/Formula-Cookbook
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Tdsql < Formula
  homepage "https://github.com/groupon/tdsql"
  url "https://github.com/groupon/tdsql/archive/tdsql-2014.05.20_18.30.tar.gz"
  sha1 "51c765151bb4b41b5bc469960dff8e4f8739bc20"

  depends_on 'readline'
  depends_on 'cpanminus'
  depends_on 'dbd-teradata'

  depends_on 'DBI' => :perl
  depends_on 'Term::ReadKey' => :perl
  depends_on 'Text::CSV_XS' => :perl

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    bin.install "bin/tdsql"
    man1.install "share/man/man1/tdsql.1"
  end

  def caveats
    s = <<-EOS.undent
        THIS FORMULA REQUIRES SUDO. Mainly because if it didn't, then you would
        have to make a few modifications to your perl install, and ain't nobody
        got time fo dat.

        FURTHERMORE. You will need to perform the follow POST-INSTALL steps for
        tdsql to work correctly:

            brew link --force readline
            sudo cpanm Term::ReadLine::Gnu
            brew unlink readline
    EOS
    s
  end
end
