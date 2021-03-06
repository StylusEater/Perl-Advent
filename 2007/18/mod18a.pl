use Acme::Curses::Marquee;
use Curses;
use Time::HiRes 'usleep';

#Set height and width of scroll area
use constant {X=>80, Y=>9};

#Start your engines
initscr;

#Create the scrolling area half-way down the standard terminal
#Unfortunately, instantiating it in the marquee maker segfaults
my $w = subwin(Y,X,8,0);

#Make the marquee
my $m = Acme::Curses::Marquee->new( window => $w,
                                    height => Y,
                                    width  => X,
                                    font   => 'larry3d', #Nyuck nyuck
                                    text   => 'Happy Birthday Perl!' );
#Wheeeee!
while (1) {
  usleep(75_000);
  $m->scroll;
}
