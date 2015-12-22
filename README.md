# trunkTexts
A text/email program to remind people when they have a show the next morning. I used Cron to make it automatically send at 8:30pm every night.
This program reads from another file with lines of the format '2014-12-05 9:00 AK SZ MM RK SK', telling the date and time of the show, with initials of the people to send it to (these initials are hash keys to the person's email and cell phone information), and only sends to the people listed next to the next day's date.


I made this program for a group I am in, called TRUNK. We have early shows in the mornings, but only 2-3 times a week. People were forgetting which days they had shows and weren't setting alarms, causing a lot of issues. I made this email/text program to remind people the night before to set an alarm and to be ready the next morning.
