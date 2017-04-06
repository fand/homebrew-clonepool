class Clonepool < Formula
  desc "Manage git clones with ghq, peco"
  homepage "https://fand.github.io/clonepool/"
  url "fand.github.io/clonepool/bin/clonepool-0.0.0.tar.gz"
  sha256 "c520bd8de314e3f2efd7ea9c3da367a437100af070b044048d3aa695a472e794"

  depends_on :java => "1.6+"
  depends_on "peco"
  depends_on "ghq"

  def install
    libexec.install "clonepool.jar"

    (bin/"clonepool").write <<-EOS.undent
      #!/bin/sh
      java -jar #{libexec}/clonepool.jar $@
    EOS
  end

  test do
    assert_match version, shell_output("#{bin}/clonepool -v")
  end
end
