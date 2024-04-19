# frozen_string_literal: true

module ApplicationHelper
  def head_info(tag, text)
    content_for :"meta_#{tag}", text
  end

  def yield_head_info(tag, default_text = '')
    content_for?(:"meta_#{tag}") ? content_for(:"meta_#{tag}") : default_text
  end

  def current_page?(page)
    case page
    when 'index'
      params[:controller] == 'pages' && params[:action] == 'index'
    when 'about'
      params[:controller] == 'pages' && params[:action] == 'about'
    else
      params[:controller] == page
    end
  end

  def human_result_time(time)
    return 'xx:xx' unless time

    time.strftime(time.hour.zero? ? '%M:%S' : '%H:%M:%S')
  end

  def human_result_pace(time, distance = 5)
    return unless time

    avg_sec = (time_to_sec(time) / distance.to_f).round
    format '%<min>d:%<sec>02d', min: avg_sec / 60, sec: avg_sec % 60
  end

  def time_to_sec(time)
    (((time.hour * 60) + time.min) * 60) + time.sec
  end

  def human_event_category(event)
    t "activerecord.attributes.event.categories.#{event.category}"
  end

  def human_athlete_gender(athlete)
    t "activerecord.attributes.athlete.genders.#{athlete.gender}"
  end

  def sanitized_text(text)
    sanitize text, tags: %w[strong em s blockquote pre ol ul li a p], attributes: %w[href rel target]
  end

  def external_link_to(title = nil, options = nil, html_options = {}, &)
    link_to title, *[options, html_options.merge(target: '_blank', rel: 'noopener')].compact, &
  end
end
