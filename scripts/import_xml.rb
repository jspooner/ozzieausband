#!/usr/bin/env ruby
require 'rss'

@template = %Q(---
title: "TITLE"
date: DATE
draft: false
categories: ["Blog"]
series: []
tags: []
---
BODY
)



@caption = %Q(<div class="card" style="">
    imageTag
    <div class="card-body">
      <p class="card-text">captionText</p>
    </div>
  </div>
)
@captionRegex = /(\[captio)(\/*?)\w+?.+?(caption\])/
def replace_captions testStr
  testStr.gsub(@captionRegex) do |caption|
    captionText = caption.gsub(/(\[captio)(\/*?)\w+?.+?(\])/,'').gsub(/(\[\/c)(\/*?)\w+?.+?(\])/,'').gsub(/<(\/*?)(?!(em|p|br\s*\/|strong))\w+?.+?>/,'').strip
    imageTag = caption.match(/<im(\/*?)\w+?.+?>/).to_s
      .gsub(/width=(\'|\")([ -0-9a-zA-Z:]*[ 0-9a-zA-Z;]*)*(\'|\")/, '')
      .gsub(/height=(\'|\")([ -0-9a-zA-Z:]*[ 0-9a-zA-Z;]*)*(\'|\")/, '')
      .gsub(/class=(\'|\")([ -0-9a-zA-Z:]*[ 0-9a-zA-Z;]*)*(\'|\")/, '')
    @caption.gsub('captionText',captionText).gsub('imageTag',imageTag)
  end
end
# testStr='[caption id="attachment_22372" align="aligncenter" width="584"]<img class="size-full wp-image-22372" src="/images/2017/12/unnamed-8.jpg" alt="" width="584" height="356" /> Rick Blackhart[/caption]'
# result = replace_captions testStr

def remove_cr body
  body.gsub(/\r/," ")
end

def update_image_paths body
  body.gsub('src="https://ozzieausband.files.wordpress.com/','src="/images/')
    .gsub('src="http://ozzieausband.files.wordpress.com/','src="/images/')
end

def parse file
  # file = "./ozzieausband.wordpress.com-2017-12-14-13_45_34/bluetileobsession.wordpress.2017-12-14.001.xml"
  feed = RSS::Parser.parse(file,false)
  # puts "Title: #{feed.channel.title}"
  pages = feed.items.find_all { |i| !i.link.include?('?') && !i.content_encoded.empty? }
  pages.each do |page|
    path     = page.link.gsub('https://ozzieausband.wordpress.com/','').split('/').compact.join('/')
    p = path.split('/')
    p.pop
    `mkdir -p content/posts/#{p.join('/')}`
    indexFile = "content/posts/#{p.first}/_index.md"
    unless File.exists?(indexFile)
      body = %Q(---
title: "#{p.first}"
---
)
      File.open(indexFile,'w+') { |file| file.write(body) }
    end
    
    begin
      title = page.title.gsub('"','')
      body  = replace_captions(remove_cr(update_image_paths(page.content_encoded))) #+ "\n\n\n #{page.link}"
      doc   = @template
        .gsub('TITLE', title)
        .gsub('DATE', page.date.strftime('%FT%T%:z'))
        .gsub('BODY', body)
        # .gsub('DATE', '2017-12-17T07:32:00-08:00')
      File.open("content/posts/" + path + ".md",'w+') { |file| file.write(doc) }
    rescue Exception => e
      puts "ERROR #{path}"
      puts e
    end
  end
end

# files =  Dir.glob("./ozzieausband.wordpress.com-2017-12-14-13_45_34/*.xml").sort
# files.each do |file|
#   puts file
#   # parse(file)
# end

parse "./ozzieausband.wordpress.com-2017-12-14-13_45_34/bluetileobsession.wordpress.2017-12-14.001.xml"
parse "./ozzieausband.wordpress.com-2017-12-14-13_45_34/bluetileobsession.wordpress.2017-12-14.002.xml"
parse "./ozzieausband.wordpress.com-2017-12-14-13_45_34/bluetileobsession.wordpress.2017-12-14.003.xml"
parse "./ozzieausband.wordpress.com-2017-12-14-13_45_34/bluetileobsession.wordpress.2017-12-14.004.xml"
parse "./ozzieausband.wordpress.com-2017-12-14-13_45_34/bluetileobsession.wordpress.2017-12-14.005.xml"
parse "./ozzieausband.wordpress.com-2017-12-14-13_45_34/bluetileobsession.wordpress.2017-12-14.006.xml"
parse "./ozzieausband.wordpress.com-2017-12-14-13_45_34/bluetileobsession.wordpress.2017-12-14.007.xml"
parse "./ozzieausband.wordpress.com-2017-12-14-13_45_34/bluetileobsession.wordpress.2017-12-14.008.xml"

puts "SUCCESS"



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
