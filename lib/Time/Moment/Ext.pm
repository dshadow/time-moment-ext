package Time::Moment::Ext;
use 5.008001;
use strict;
use warnings;

our $VERSION = '0.01';

use base 'Time::Moment';

sub day {
	shift->day_of_month(@_);
}

sub from_string {
	my ($class, $string) = @_;

	if ($string)
	{
		my $l = length($string);

		$string .= 'T00Z' if ($l == 10);
		$string .= 'Z' if ($l == 19);
	}

	$class->SUPER::from_string($string, lenient => 1);
}

sub delta_years {
	my ($class, $class2) = @_;

	$class->_check_params($class2);

	my $year = $class->year;
	my $year2 = $class2->year;

	return ($year > $year2)
		? $year - $year2
		: $year2 - $year
}

sub delta_months {
	my ($class, $class2) = @_;

	$class->_check_params($class2);

	my $year = $class->year;
	my $month = $class->month;

	my $year2 = $class2->year;
	my $month2 = $class2->month;

	if ($year > $year2)
	{
		$year -= $year2;
		$month += $year * 12 if ($year);
		return $month - $month2;
	}
	else
	{
		$year2 -= $year;
		$month2 += $year2 * 12 if ($year2);
		return $month2 - $month;
	}
}

sub delta_weeks {
	shift->_calc_delta($_[0], 604800);
}

sub delta_days {
	shift->_calc_delta($_[0], 86400);
}

sub delta_hours {
	shift->_calc_delta($_[0], 3600);
}

sub delta_minutes {
	shift->_calc_delta($_[0], 60);
}

sub delta_seconds {
	shift->_calc_delta($_[0]);
}

sub _calc_delta {
	my ($class, $class2, $div) = @_;

	$class->_check_params($class2);

	my $diff = $class->compare($class2);
	return 0 if ($diff == 0);

	$diff = ($diff > 0)
		? $class->epoch - $class2->epoch
		: $class2->epoch - $class->epoch;

	return $div
		? sprintf('%.f', $diff / $div) + 0
		: $diff
}

sub _check_params {
	unless ($_[1] && (ref($_[1]) eq 'Time::Moment' || ref($_[1]) eq __PACKAGE__)) {
		require Carp;
		Carp::croak('Param must be Time::Moment(::Ext) object');
	}
}

1;
__END__

=encoding utf-8

=head1 NAME

Time::Moment::Ext - Extending Time::Moment to support SQL dates and delta between two dates

=head1 SYNOPSIS

	use Time::Moment::Ext;

	
	my $tm = Time::Moment::Ext->from_string('2015-01-18');
	
	my $tm2 = Time::Moment::Ext->from_string('2015-01-20 10:33:45');

	
	my $day_of_month = $tm->day;


	my $years_diff = $tm->delta_years($tm2);

	my $month_diff = $tm->delta_months($tm2);
	
	my $week_diff = $tm->delta_weeks($tm2);

	my $days_diff = $tm->delta_days($tm2);

	my $hours_diff = $tm->delta_hours($tm2);

	my $minutes_diff = $tm->delta_minutes($tm2);


	# (you can use all other methods from Time::Moment)

=head1 DESCRIPTION

Time::Moment::Ext is a extending of Time::Moment module. It's add support to SQL dates and delta between two dates

=head1 METHODS

=head2 from_string

	$tm = Time::Moment::Ext->from_string('2015-01-18');
	$tm2 = Time::Moment::Ext->from_string('2015-01-20 10:33:45');

=head2 day

	This is alias to $tm->day_of_month

=head2 delta_years

=head2 delta_month

=head2 delta_week

=head2 delta_days

=head2 delta_hours

=head2 delta_minutes

=head1 SEE ALSO

see L<Time::Moment>

=head1 LICENSE

Copyright 2015 (C) Konstantin Cherednichenko.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Konstantin Cherednichenko E<lt>dshadowukraine@gmail.comE<gt>

=cut

