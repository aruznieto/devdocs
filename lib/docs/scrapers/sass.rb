module Docs
  class Sass < UrlScraper
    self.type = 'yard'
    self.release = '1.82.9'
    self.base_url = 'https://sass-lang.com/documentation'
    self.root_path = 'index.html'
    self.links = {
      home: 'http://sass-lang.com/',
      code: 'https://github.com/sass/sass'
    }

    html_filters.push 'sass/entries', 'sass/clean_html'

    options[:root_title] = false

    options[:skip_patterns] = [/breaking-changes/]
    options[:trailing_slash] = false

    options[:attribution] = <<-HTML
      &copy; 2006&ndash;2024 the Sass team, and numerous contributors<br>
      Licensed under the MIT License.
    HTML
  
    private

    def get_latest_version(opts)
      get_npm_version('sass', opts)
    end

    def parse(response)
      response.body.gsub! '<span class="widont">&nbsp;</span>', '&nbsp;'
    end
  end
end
