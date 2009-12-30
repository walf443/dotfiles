use inc::Module::Install;
use Module::Install::XSUtil;
name '[% dist %]';
all_from 'lib/[% module_unix_path %].pm';

cc_warnings;
use_ppport 3.19;

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
use_test_base;
auto_include;
WriteAll;
