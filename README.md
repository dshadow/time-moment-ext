NAME
    Time::Moment::Ext - Extending Time::Moment to support SQL dates and
    delta between two dates

SYNOPSIS
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

DESCRIPTION
    Time::Moment::Ext is a extending of Time::Moment module. It's add
    support to SQL dates and delta between two dates

METHODS
  from_string
            $tm = Time::Moment::Ext->from_string('2015-01-18');
            $tm2 = Time::Moment::Ext->from_string('2015-01-20 10:33:45');

  day
            This is alias to $tm->day_of_month

  delta_years
  delta_month
  delta_week
  delta_days
  delta_hours
  delta_minutes
SEE ALSO
    see Time::Moment

LICENSE
    Copyright 2015 (C) Konstantin Cherednichenko.

    This library is free software; you can redistribute it and/or modify it
    under the same terms as Perl itself.

AUTHOR
    Konstantin Cherednichenko <dshadowukraine@gmail.com>

