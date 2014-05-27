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

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    system "cpanm", "CSV_XS"

    # So, this is generally a Bad Idea but in this case we just need
    # to temporarily link to readline so this module builds successfully.
    system "brew", "link", "--force", "readline"
    system "cpanm", "Term::ReadLine::Gnu"
    system "brew", "unlink", "readline"

    bin.install "tdsql"
    man1.install "tdsql.1"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test tdsql`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
