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
    { category_name: 'Woodworking', description: 'Projects involving woodworking.' }
    
  ]
  
  categories.each do |category|
    Category.find_or_create_by!(category_name: category[:category_name], description: category[:description])
  end
  