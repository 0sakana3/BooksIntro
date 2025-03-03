module BooksHelper
  def book_image_tag(book)
    if book.image.attached?
      image_tag book.image.variant(resize_to_limit: [200, 200]), class: 'book-image'
    else
      image_tag 'https://booksintro2025-defaults.s3.ap-northeast-1.amazonaws.com/default_image.png', class: 'book-image',
                                                                                                     width: 200, height: 200
    end
  end

  def format_text_for_display(text)
    text.gsub("\n", '<br>').html_safe
  end
end
