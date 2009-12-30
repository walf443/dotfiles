use inc::Module::Install;
use Module::Install::XSUtil;
use Module::Install::MicroTemplate;

name '[% dist %]';
all_from 'lib/[% module_unix_path %].pm';

cc_warnings;
use_ppport 3.19;

tests 't/*.t';
author_tests 'xt';

render_mt '[% module %].mt.xs' => '[% module %].xs';

build_requires 'Test::More';
use_test_base;
auto_include;
WriteAll;
