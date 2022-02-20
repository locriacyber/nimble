import unittest, os
import testscommon

from nimblepkg/common import cd

suite "init":
  ## https://github.com/nim-lang/nimble/pull/983
  test "init within directory that is invalid package name will not create new directory":
    let tempdir = getTempDir() / "a-b"
    createDir(tempdir)
    cd(tempdir):
      let args = ["init"]
      let (output, exitCode) = execNimbleYes(args)
      check exitCode == QuitSuccess
      check not dirExists("a_b")
      check fileExists("a_b.nimble")
