#!/usr/bin/env bash

rm ./tmp/images.txt
rm ./tmp/jpgs.txt
# cat ozzieausband.wordpress.com-2017-12-14-13_45_34/bluetileobsession.wordpress.2017-12-14.001.xml |  grep -o '<a .*href=.*>' | sed -e 's/<a /<a /g' | sed -e 's/<a .*href=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d' >> tmp/images.txt
# cat ozzieausband.wordpress.com-2017-12-14-13_45_34/bluetileobsession.wordpress.2017-12-14.001.xml |  grep -o '<a .*href=.*>' | sed -e 's/<a /<a /g' | sed -e 's/<a .*href=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d' >> tmp/images.txt
# cat ozzieausband.wordpress.com-2017-12-14-13_45_34/bluetileobsession.wordpress.2017-12-14.002.xml |  grep -o '<a .*href=.*>' | sed -e 's/<a /<a /g' | sed -e 's/<a .*href=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d' >> tmp/images.txt
# cat ozzieausband.wordpress.com-2017-12-14-13_45_34/bluetileobsession.wordpress.2017-12-14.003.xml |  grep -o '<a .*href=.*>' | sed -e 's/<a /<a /g' | sed -e 's/<a .*href=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d' >> tmp/images.txt
# cat ozzieausband.wordpress.com-2017-12-14-13_45_34/bluetileobsession.wordpress.2017-12-14.004.xml |  grep -o '<a .*href=.*>' | sed -e 's/<a /<a /g' | sed -e 's/<a .*href=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d' >> tmp/images.txt
# cat ozzieausband.wordpress.com-2017-12-14-13_45_34/bluetileobsession.wordpress.2017-12-14.005.xml |  grep -o '<a .*href=.*>' | sed -e 's/<a /<a /g' | sed -e 's/<a .*href=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d' >> tmp/images.txt
# cat ozzieausband.wordpress.com-2017-12-14-13_45_34/bluetileobsession.wordpress.2017-12-14.006.xml |  grep -o '<a .*href=.*>' | sed -e 's/<a /<a /g' | sed -e 's/<a .*href=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d' >> tmp/images.txt
# cat ozzieausband.wordpress.com-2017-12-14-13_45_34/bluetileobsession.wordpress.2017-12-14.007.xml |  grep -o '<a .*href=.*>' | sed -e 's/<a /<a /g' | sed -e 's/<a .*href=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d' >> tmp/images.txt
# cat ozzieausband.wordpress.com-2017-12-14-13_45_34/bluetileobsession.wordpress.2017-12-14.008.xml |  grep -o '<a .*href=.*>' | sed -e 's/<a /<a /g' | sed -e 's/<a .*href=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d' >> tmp/images.txt

cat ozzieausband.wordpress.com-2017-12-14-13_45_34/bluetileobsession.wordpress.2017-12-14.001.xml |  grep -o '<img .*src=.*>' | sed -e 's/<img /<img /g' | sed -e 's/<img .*src=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d' >> tmp/images.txt
cat ozzieausband.wordpress.com-2017-12-14-13_45_34/bluetileobsession.wordpress.2017-12-14.002.xml |  grep -o '<img .*src=.*>' | sed -e 's/<img /<img /g' | sed -e 's/<img .*src=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d' >> tmp/images.txt
cat ozzieausband.wordpress.com-2017-12-14-13_45_34/bluetileobsession.wordpress.2017-12-14.003.xml |  grep -o '<img .*src=.*>' | sed -e 's/<img /<img /g' | sed -e 's/<img .*src=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d' >> tmp/images.txt
cat ozzieausband.wordpress.com-2017-12-14-13_45_34/bluetileobsession.wordpress.2017-12-14.004.xml |  grep -o '<img .*src=.*>' | sed -e 's/<img /<img /g' | sed -e 's/<img .*src=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d' >> tmp/images.txt
cat ozzieausband.wordpress.com-2017-12-14-13_45_34/bluetileobsession.wordpress.2017-12-14.005.xml |  grep -o '<img .*src=.*>' | sed -e 's/<img /<img /g' | sed -e 's/<img .*src=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d' >> tmp/images.txt
cat ozzieausband.wordpress.com-2017-12-14-13_45_34/bluetileobsession.wordpress.2017-12-14.006.xml |  grep -o '<img .*src=.*>' | sed -e 's/<img /<img /g' | sed -e 's/<img .*src=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d' >> tmp/images.txt
cat ozzieausband.wordpress.com-2017-12-14-13_45_34/bluetileobsession.wordpress.2017-12-14.007.xml |  grep -o '<img .*src=.*>' | sed -e 's/<img /<img /g' | sed -e 's/<img .*src=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d' >> tmp/images.txt
cat ozzieausband.wordpress.com-2017-12-14-13_45_34/bluetileobsession.wordpress.2017-12-14.008.xml |  grep -o '<img .*src=.*>' | sed -e 's/<img /<img /g' | sed -e 's/<img .*src=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d' >> tmp/images.txt

# cat tmp/images.txt | grep jpg >> tmp/jpgs.txt
# cat tmp/jpgs.txt | wc -l
