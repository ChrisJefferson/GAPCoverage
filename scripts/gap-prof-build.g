LoadPackage("profiling");
x := ReadLineByLineProfile("standardcover.gz");;
OutputAnnotatedCodeCoverageFiles(x, "/", "gapprof-out");
