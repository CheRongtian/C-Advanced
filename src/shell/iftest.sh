#!/bin/bash
:<< END
You can run this shell command for many times to see the difference among outputs
END
if test ! -e a_test_file; then
    echo test file had not existed
    touch a_test_file
else
    echo test file existed
    rm a_test_file
fi