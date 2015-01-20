use strict;
use Test::More 0.98;

use_ok $_ for qw(
	Time::Moment::Ext
);

my $tm = Time::Moment::Ext->from_string('2015-01-20 12:20:00');

ok($tm, 'from_string. long string');

ok($tm->year == 2015 && $tm->month == 1 && $tm->day == 20 && $tm->hour == 12 && $tm->minute == 20 && $tm->second == 0, 'from_string check');

$tm = Time::Moment::Ext->from_string('2015-01-18');

ok($tm, 'from_string. short string');

ok($tm->year == 2015 && $tm->month == 1 && $tm->day == 18 && $tm->hour == 0 && $tm->minute == 0 && $tm->second == 0, 'from_string check');

done_testing;

