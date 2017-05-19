class AddShowTestimonialToPage < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :show_testimonials, :boolean, default: false
  end
end
