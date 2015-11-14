class Scraping
  def self.page_titles(page_params)
    agent = Mechanize.new
    p = agent.get(page_params[:url])

    title = p.at('title').inner_text
    got_tag = p.at('meta[property="og:image"]')
    got_url = got_tag[:content]
    # if meta_tag = p.at('meta[property="og:image"]')
    #   got_url = meta_tag[:content]
    # elsif meta_tag = p.at...
    #   got_url = meta_tag[:content]
    # elsif meta_tag = p.at...
    #   got_url = meta_tag[:content]
    # elsif meta_tag = p.at...
    #   got_url = meta_tag[:content]
    # elsif meta_tag = p.at...
    #   got_url = meta_tag[:content]
    # else
    # end
    group = Group.find page_params[:group_id]
    # group.pages.where(title: title).first_or_initialize(image_url: got_url, url: page_params[:url])
    page = group.pages.where(title: title).first_or_initialize(image_url: got_url)
    page.url = page_params[:url]
    page.save
    # page = Page.where(title: title).first_or_initialize
    # page.image_url = got_url
    # page.url = page_params[:url]
    # page.group_id = page_params[:group_id]
    # page.save

    # page.save{image_url: got_url, url: page_params[:url], group_id: page_params[:group_id]}
  end
end
