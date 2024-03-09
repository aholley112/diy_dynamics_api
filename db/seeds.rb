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
  
  user = User.first

  categories.each do |category|
    Category.find_or_create_by!(category_name: category[:category_name], description: category[:description])
  end

  category_projects.each do |category_name, projects|
    category = Category.find_or_create_by!(category_name: category_name)
    
    projects.each do |project_attrs|
      project = category.projects.find_or_initialize_by(title: project_attrs[:title])
      project.assign_attributes(project_attrs.merge(user: user))
      project.save! if project.new_record? || project.changed?
    end
  end

  kids_crafts = Category.find_or_create_by!(category_name: 'Kids Crafts', description: 'Crafting projects for kids.')
  
  rock_painting = Project.create!(
    title: "Rock Painting",
    description: "A simple and fun project for painting rocks. Great for kids to express their creativity.",
    instructions: "Collect some smooth rocks from outdoors, use acrylic paints to create designs.",
    est_time_to_completion: "2 hours",
    user: user,
    is_favorite_project: false
  )
  
  finger_puppets = Project.create!(
    title: "Finger Puppets",
    description: "Create your own set of fun and engaging finger puppets using felt and other materials.",
    instructions: "Cut felt into shapes of animals, glue parts together, and decorate.",
    est_time_to_completion: "1 hour",
    user: user,
    is_favorite_project: false
  )
  
 
  kids_crafts.projects << rock_painting
  kids_crafts.projects << finger_puppets

  gardening = Category.find_or_create_by!(category_name: 'Gardening', description: 'Gardening projects including planters, garden beds, and landscaping ideas.')

herb_garden = Project.create!(
  title: "Herb Garden",
  description: "Create your own herb garden with this simple project. Perfect for beginners!",
  instructions: "Choose a sunny spot, prepare the soil, plant herbs like basil, parsley, and mint, and ensure regular watering.",
  est_time_to_completion: "3 hours",
  user: user,
  is_favorite_project: false
)

succulent_planter = Project.create!(
  title: "Succulent Planter",
  description: "Design a beautiful and low-maintenance succulent planter for your home or office.",
  instructions: "Select various succulents, prepare a planter with drainage, arrange the succulents, and add soil.",
  est_time_to_completion: "2 hours",
  user: user,
  is_favorite_project: false
)

gardening.projects << herb_garden
gardening.projects << succulent_planter

costumes_and_cosplay = Category.find_or_create_by!(category_name: 'Costumes & Cosplay', description: 'DIY costumes and cosplay ideas.')

diy_superhero_cape = Project.create!(
  title: "DIY Superhero Cape",
  description: "Create your own superhero cape with customizable colors and symbols.",
  instructions: "Choose your fabric, cut out the cape shape, sew the edges, and add your unique symbol with fabric paint or patches.",
  est_time_to_completion: "4 hours",
  user: user,
  is_favorite_project: false
)

homemade_robot_costume = Project.create!(
  title: "Homemade Robot Costume",
  description: "Construct a futuristic robot costume using recycled materials.",
  instructions: "Collect boxes of various sizes, silver spray paint, and duct tape. Assemble the boxes into a body suit and headpiece, spray paint everything silver, and add details with markers or more tape.",
  est_time_to_completion: "5 hours",
  user: user,
  is_favorite_project: false
)

costumes_and_cosplay.projects << diy_superhero_cape
costumes_and_cosplay.projects << homemade_robot_costume

biology_for_kids = Category.find_or_create_by!(category_name: 'Biology for Kids', description: 'Projects and experiments to learn about biology.')

simple_plant_cell_model = Project.create!(
  title: "Simple Plant Cell Model",
  description: "Build a 3D model of a plant cell using household items to learn about cell structure.",
  instructions: "Use a large, clear plastic container as the cell. Fill it with gelatin for cytoplasm. Use fruits like grapes (chloroplasts), a large lima bean (nucleus), and yarn (endoplasmic reticulum) to represent cell parts.",
  est_time_to_completion: "2 hours",
  user: user,
  is_favorite_project: false
)

backyard_bug_hunt = Project.create!(
  title: "Backyard Bug Hunt",
  description: "Explore your backyard to find and identify different insects and learn about their habitats.",
  instructions: "Equip with a magnifying glass and a notebook. Gently catch insects using a net or by hand wearing gloves. Observe, identify, and release. Record your findings with drawings or photos.",
  est_time_to_completion: "3 hours",
  user: user,
  is_favorite_project: false
)

biology_for_kids.projects << simple_plant_cell_model
biology_for_kids.projects << backyard_bug_hunt