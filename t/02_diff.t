use strict;
use Test::More 0.98;

use_ok $_ for qw(
	Time::Moment::Ext
);

my $tm = Time::Moment::Ext->from_string('2015-01-20 12:20:00');
my $tm2 = Time::Moment::Ext->from_string('2015-01-18 11:25:00');

ok($tm->delta_seconds($tm2) == 176100, 'delta_seconds');

ok($tm->delta_minutes($tm2) == 2935, 'delta_minutes');

ok($tm->delta_hours($tm2) == 49, 'delta_hours');

ok($tm->delta_days($tm2) == 2, 'delta_days');

$tm2 = Time::Moment::Ext->from_string('2015-02-20 12:20:00');

ok($tm->delta_weeks($tm2) == 4, 'delta_weeks');

$tm2 = Time::Moment::Ext->from_string('2013-03-21 12:20:00');

ok($tm->delta_months($tm2) == 22, 'delta_months');

ok($tm->delta_years($tm2) == 2, 'delta_years');

done_testing;

