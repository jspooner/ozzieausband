#!/usr/bin/env ruby
require 'rss'

# files =  Dir.glob("./ozzieausband.wordpress.com-2017-12-14-13_45_34/bluetileobsession.wordpress.2017-12-14.001.xml")
# files.each do |file|
#   puts file
#   # puts open(file).read
#   feed = RSS::Parser.parse(file,false)
#   puts "Title: #{feed.channel.title}"
# end


template = %Q(---
title: "TITLE"
date: DATE
draft: false
---
BODY
)

file = "./ozzieausband.wordpress.com-2017-12-14-13_45_34/bluetileobsession.wordpress.2017-12-14.001.xml"
feed = RSS::Parser.parse(file,false)
# puts "Title: #{feed.channel.title}"
# puts "\n\n\n\n\n\n\n\n\n"

pages = feed.items.find_all { |i| !i.link.include?('?')}
pages.each do |page|
  # puts page.link if page.content_encoded.empty?
  puts page.categories.collect { |c| c.to_s }
end




# feed.items.each do |item|
#   puts item.title
#   puts item.link
#   puts item.date
#   puts item.pubDate
#   puts item.dc_creator
#   puts item.description
#
#   puts item.guid.to_s
#   puts item.tag_name
#   puts item.category.to_s
#   puts item.categories.collect { |c| c.to_s }
#
#   puts item.to_s
#   puts "\n\n\n\n\n\n\n\n\n"
# end

# :dc_titles,
# :dc_title,
# :dc_title=,
# :set_dc_title,
# :dc_descriptions,
# :dc_description,
# :dc_description=,
# :set_dc_description,
# :dc_creators,
# :dc_creator,
# :dc_creator=,
# :set_dc_creator,
# :dc_subjects,
# :dc_subject,
# :dc_subject=,
# :set_dc_subject,
# :dc_publishers,
# :dc_publisher,
# :dc_publisher=,
# :set_dc_publisher,
# :dc_contributors,
# :dc_contributor,
# :categories,
# :set_dc_contributor,
# :category=,
# :set_category,
# :enclosure=,
# :dc_type,
# :dc_type=,
# :date=,
# :dc_format,
# :dc_formats,
# :dc_types,
# :link,
# :dc_identifiers,
# :dc_format=,
# :set_dc_identifier,
# :dc_identifier,
# :dc_contributor=,
# :dc_sources,
# :set_dc_format,
# :dc_identifier=,
# :dc_source=,
# :set_dc_type,
# :source,
# :comments=,
# :dc_language,
# :set_dc_language,
# :guid=,
# :dc_languages,
# :dc_source,
# :description=,
# :set_dc_source,
# :dc_relation,
# :dc_relations,
# :dc_language=,
# :dc_relation=,
# :set_dc_relation,
# :dc_coverages,
# :author,
# :dc_coverage,
# :dc_coverage=,
# :dc_rights_list,
# :dc_rights,
# :set_dc_coverage,
# :set_dc_rights,
# :set_dc_date,
# :dc_date,
# :dc_rights=,
# :dc_rightses,
# :trackback_about=,
# :date_without_dc_date=,
# :trackback_ping,
# :dc_date=,
# :trackback_ping=,
# :dc_dates,
# :trackback_abouts,
# :trackback_about,
# :set_trackback_about,
# :itunes_name,
# :itunes_name=,
# :date,
# :itunes_email=,
# :comments,
# :itunes_email,
# :description,
# :itunes_duration,
# :link=,
# :title,
# :title=,
# :author=,
# :pubDate,
# :pubDate=,
# :itunes_author=,
# :itunes_block=,
# :itunes_author,
# :itunes_block,
# :itunes_block?,
# :guid,
# :source=,
# :itunes_explicit,
# :itunes_explicit=,
# :itunes_explicit?,
# :itunes_keywords=,
# :itunes_keywords,
# :itunes_keywords_content,
# :itunes_subtitle,
# :itunes_subtitle=,
# :content_encoded,
# :content_encoded=,
# :itunes_summary=,
# :itunes_summary,
# :itunes_duration=,
# :enclosure,
# :category,
# :to_s,
# :convert,
# :full_name,
# :valid?,
# :validate,
# :tag_name,
# :do_validate,
# :do_validate=,
#
