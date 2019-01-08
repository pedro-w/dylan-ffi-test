# dylan-ffi-test

This is to illustrate a problem with the C-FFI library
in Dylan.

It applies to 2014.1 and the current git code (and presumably all
versions between.)

It was found from the `c-ffi-test-suite`, which is part of the
opendylan build. Test `c-struct-test` gives this output:

      <maximal> struct size: [152 (from expression "struct-maximal-size()") and 0 (from expression "size-of(<maximal>)") are not =.]

The size of a structure (as determined by `size-of(<class>)`) is not
always calculated. It seems not to be, if called from Testworks. If
called 'directly' it is OK.

The size calculation is done at compile time, so the output of the C
back end just has a hard-coded zero. For this reason it's a bit tricky
to debug because the problem is a function *not* being called from
within `dylan-compiler`.

This repository is a simplified test to try and disentangle the
problem from the opendylan build system.

The 'test suite' gives this output

    fff-test-suite failed
      itself failed
        size-of(<maximal>) = 152 failed [0 (from expression "size-of(<maximal>)") and 152 (from expression "152") are not =.]
        size-of(<minimal>) = 16 failed [0 (from expression "size-of(<minimal>)") and 16 (from expression "16") are not =.]

but there is also some immediate code:

    format-out("Size of %= is %d!\n", <maximal>, size-of(<maximal>));
	
which gives (when built/run at the same time as the test suite!)

    Size of {class <maximal>} is 152!

Also there is this defined but unused function:

	define c-callable-wrapper bogus of
		method (j :: <maximal*>) 
		  //j.max-1;
		end
		parameter j :: <maximal*>;
	  c-name: "bogus"
	end;


Uncommenting the line `// j.max-1` somehow forces the `size-of`
calculation and the test suite passes.

