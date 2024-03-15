categories = [
  { category_name: 'Gardening', description: 'Gardening projects including planters, garden beds, and landscaping ideas.' },
  { category_name: 'Kids Crafts', description: 'Crafting projects for kids.' },
  { category_name: 'Costumes & Cosplay', description: 'DIY costumes and cosplay ideas.' },
  { category_name: 'Biology for Kids', description: 'Projects and experiments to learn about biology.'},
  { category_name: 'Home Decor', description: 'Decorative projects for your home.' },
  { category_name: 'Upcycling', description: 'Creative ideas for upcycling and repurposing old items into something new.' },
  { category_name: 'DIY Furniture', description: 'Projects for building your own furniture.' },
  { category_name: 'DIY Home Improvement', description: 'Projects for improving your home.' },
  { category_name: 'Painting & Decorating', description: 'Projects involving painting and decorating to beautify your living spaces.' },
  { category_name: 'Sewing & Textiles', description: 'DIY projects related to sewing, knitting, and working with textiles.' },
  { category_name: 'Jewelry Making', description: 'Crafting your own jewelry from various materials.' },
  { category_name: 'Pottery & Ceramics', description: 'Creating pottery and ceramics items like mugs, vases, and decorative pieces.' },
  { category_name: 'Paper Crafts', description: 'Projects involving paper, such as origami, scrapbooking, and card making.' },
  { category_name: 'Cooking & Baking', description: 'DIY projects in the kitchen, including recipes and cooking techniques.' },
  { category_name: 'Woodworking', description: 'Projects involving woodworking.' },
  { category_name: 'Sustainable Living & Eco Projects', description: 'Embrace sustainability with DIY projects that help reduce waste and promote eco-friendly practices.' },
  { category_name: 'Health & Wellness DIY', description: 'Create your own health and wellness products, from natural skincare and homemade soaps to herbal teas and aromatherapy essentials.' },
  { category_name: 'Tech & Gadgets DIY',
  description: 'Dive into the world of technology with DIY projects. Perfect for enthusiasts looking to combine creativity with tech.'
  }
  
]

user = User.first

categories.each do |category_attributes|
  Category.find_or_create_by!(category_attributes)
end

def find_or_create_project(category_name, project_attrs, user)
  category = Category.find_by(category_name: category_name)
  return unless category

  project = Project.find_or_create_by!(title: project_attrs[:title]) do |p|
    p.description = project_attrs[:description]
    p.instructions = project_attrs[:instructions]
    p.est_time_to_completion = project_attrs[:est_time_to_completion]
    p.user = user
    p.is_favorite_project = project_attrs[:is_favorite_project]
    
  end

  project.categories << category unless project.categories.include?(category)

  if project.errors.any?
    puts "Project not created due to errors: #{project.errors.full_messages.join(", ")}"
  else
    project
  end
end