module Jekyll
    class MarkdownBlock < Liquid::Block
        def initialize(tag_name, text, tokens)
            super
        end
        
        require "kramdown"
        def render(context)
            content = super.strip
            Kramdown::Document.new(content, input: "GFM").to_html
        end
    end
end

Liquid::Template.register_tag('markdown', Jekyll::MarkdownBlock)