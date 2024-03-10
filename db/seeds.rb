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

  def find_or_create_project(category_name, project_attrs, user)
    category = Category.find_or_create_by!(category_name: category_name)
    project = Project.find_or_create_by!(title: project_attrs[:title]) do |p|
      p.description = project_attrs[:description]
      p.instructions = project_attrs[:instructions]
      p.est_time_to_completion = project_attrs[:est_time_to_completion]
      p.user = user
      p.is_favorite_project = project_attrs[:is_favorite_project]
    end
  
    category.projects << project unless category.projects.include?(project)
end

  find_or_create_project('Kids Crafts', {
    title: "Rock Painting",
    description: "A simple and fun project for painting rocks. Great for kids to express their creativity.",
    instructions: "Collect some smooth rocks from outdoors, use acrylic paints to create designs.",
    est_time_to_completion: "2 hours",
    user: user,
    is_favorite_project: false
 }, user)
  
  find_or_create_project('Kids Crafts', {
    title: "Finger Puppets",
    description: "Create your own set of fun and engaging finger puppets using felt and other materials.",
    instructions: "Cut felt into shapes of animals, glue parts together, and decorate.",
    est_time_to_completion: "1 hour",
    user: user,
    is_favorite_project: false
  }, user)

  find_or_create_project('Kids Crafts', {
    title: "Homemade Play Dough",
    description: "Create non-toxic, homemade play dough with just a few kitchen ingredients. A fun and safe craft for kids to sculpt and play with.",
    instructions: "Mix 2 cups of flour, 1/2 cup of salt, 2 tbsp of cream of tartar, 2 tbsp of vegetable oil, and 1 1/2 cups of boiling water. Add food coloring if desired. Knead until smooth.",
    est_time_to_completion: "1 hour",
    user: user,
    is_favorite_project: false
  }, user)
  
  find_or_create_project('Kids Crafts', {
    title: "Paper Plate Animals",
    description: "Craft cute animals using paper plates and basic art supplies. A creative and simple project for kids of all ages.",
    instructions: "Cut paper plates to shape and decorate with paint, markers, colored paper, and googly eyes to create various animals. Use glue to assemble pieces.",
    est_time_to_completion: "2 hours",
    user: user,
    is_favorite_project: false
  }, user)
  

find_or_create_project('Gardening', {
  title: "Herb Garden",
  description: "Create your own herb garden with this simple project. Perfect for beginners!",
  instructions: "Choose a sunny spot, prepare the soil, plant herbs like basil, parsley, and mint, and ensure regular watering.",
  est_time_to_completion: "3 hours",
  user: user,
  is_favorite_project: false
}, user)

find_or_create_project('Gardening', {
  title: "Succulent Planter",
  description: "Design a beautiful and low-maintenance succulent planter for your home or office.",
  instructions: "Select various succulents, prepare a planter with drainage, arrange the succulents, and add soil.",
  est_time_to_completion: "2 hours",
  user: user,
  is_favorite_project: false
}, user)

find_or_create_project('Gardening', {
  title: "Pollinator Garden",
  description: "Create a garden space dedicated to attracting and supporting pollinators like bees, butterflies, and hummingbirds. Choose plants that provide nectar and pollen throughout the growing season.",
  instructions: "Select a sunny location and prepare the soil. Plant a mix of native flowering plants that bloom at different times of the year. Include plants like lavender, bee balm, and milkweed. Add a water source, like a shallow birdbath.",
  est_time_to_completion: "5 hours",
  user: user,
  is_favorite_project: false
}, user)

find_or_create_project('Gardening', {
  title: "Vegetable Container Garden",
  description: "Start a vegetable garden in containers, perfect for small spaces or urban gardening. Grow your own vegetables like tomatoes, peppers, and herbs.",
  instructions: "Choose containers with good drainage. Fill with high-quality potting soil. Plant seeds or seedlings for your chosen vegetables. Place in a location that receives at least 6 hours of sunlight daily. Water and fertilize as needed.",
  est_time_to_completion: "2 hours (plus growing season)",
  user: user,
  is_favorite_project: false
}, user)

find_or_create_project('Costumes & Cosplay', {
  title: "DIY Superhero Cape",
  description: "Create your own superhero cape with customizable colors and symbols.",
  instructions: "Choose your fabric, cut out the cape shape, sew the edges, and add your unique symbol with fabric paint or patches.",
  est_time_to_completion: "4 hours",
  user: user,
  is_favorite_project: false
}, user)

find_or_create_project('Costumes & Cosplay', {
  title: "Homemade Robot Costume",
  description: "Construct a futuristic robot costume using recycled materials.",
  instructions: "Collect boxes of various sizes, silver spray paint, and duct tape. Assemble the boxes into a body suit and headpiece, spray paint everything silver, and add details with markers or more tape.",
  est_time_to_completion: "5 hours",
  user: user,
  is_favorite_project: false
}, user)

find_or_create_project('Costumes & Cosplay', {
  title: "Fairy Wings",
  description: "Design and create magical fairy wings for costumes or dress-up play. Customize with colors and decorations.",
  instructions: "Use wire hangers to form the wing shape and cover with sheer fabric. Secure with tape and paint with glitter and decorations. Attach elastic bands to wear.",
  est_time_to_completion: "3 hours",
  user: user,
  is_favorite_project: false
}, user)

find_or_create_project('Costumes & Cosplay', {
  title: "Pirate Hat",
  description: "Craft your own pirate hat with cardboard and basic crafting materials for a swashbuckling costume accessory.",
  instructions: "Cut cardboard into the shape of a pirate hat. Paint black and add a skull and crossbones design. Attach a bandana or fabric around the base for added flair.",
  est_time_to_completion: "2 hours",
  user: user,
  is_favorite_project: false
}, user)


find_or_create_project('Biology for Kids', {
  title: "Simple Plant Cell Model",
  description: "Build a 3D model of a plant cell using household items to learn about cell structure.",
  instructions: "Use a large, clear plastic container as the cell. Fill it with gelatin for cytoplasm. Use fruits like grapes (chloroplasts), a large lima bean (nucleus), and yarn (endoplasmic reticulum) to represent cell parts.",
  est_time_to_completion: "2 hours",
  user: user,
  is_favorite_project: false
}, user)

find_or_create_project('Biology for Kids', {
  title: "Backyard Bug Hunt",
  description: "Explore your backyard to find and identify different insects and learn about their habitats.",
  instructions: "Equip with a magnifying glass and a notebook. Gently catch insects using a net or by hand wearing gloves. Observe, identify, and release. Record your findings with drawings or photos.",
  est_time_to_completion: "3 hours",
  user: user,
  is_favorite_project: false
}, user)

find_or_create_project('Biology for Kids', {
  title: "DIY Microscope Slides",
  description: "Learn about the microscopic world by creating your own slides from household items or backyard finds.",
  instructions: "Collect thin, transparent objects like onion skin, leaves, or pond water. Place them on a glass slide and cover with a cover slip. Observe under a microscope.",
  est_time_to_completion: "1 hour",
  user: user,
  is_favorite_project: false
}, user)

find_or_create_project('Biology for Kids', {
  title: "Homemade Volcano Experiment",
  description: "Understand chemical reactions by creating a homemade volcano that erupts with baking soda and vinegar.",
  instructions: "Build a volcano structure with clay or dirt. Create a cavity at the top and place a container inside. Mix baking soda, food coloring, and dish soap in the container. Pour vinegar to start the eruption.",
  est_time_to_completion: "2 hours",
  user: user,
  is_favorite_project: false
}, user)

find_or_create_project('Home Decor', {
  title: "Geometric Wall Art",
  description: "Create a stunning piece of geometric wall art using just painters tape and your choice of paint colors. This project can add a modern touch to any room in your home.",
  instructions: "Choose your canvas size. Apply painters tape in a geometric pattern across the canvas. Paint each section with your chosen colors. Once dry, carefully remove the tape to reveal your design. Mount your artwork on the wall with appropriate hanging materials.",
  est_time_to_completion: "4 hours",
  user: user,
  is_favorite_project: false
}, user)

find_or_create_project('Home Decor', {
  title: "DIY Scented Candles",
  description: "Craft your own scented candles to cozy up your space or to give as thoughtful handmade gifts. Customize with your favorite scents and colors.",
  instructions: "Melt soy wax in a double boiler, add fragrance oils once melted, and dye if desired. Center the wick in a clean jar and carefully pour in the melted wax. Allow to cool and set completely before trimming the wick and using.",
  est_time_to_completion: "2 hours (plus cooling time)",
  user: user,
  is_favorite_project: false
}, user)

find_or_create_project('Home Decor', {
  title: "Rustic Wood Shelf",
  description: "Create a rustic wood shelf for an elegant addition to any room, using reclaimed wood for a touch of charm.",
  instructions: "Select a piece of reclaimed wood and sand it down. Apply a finish of your choice. Attach brackets and mount the shelf to a wall with anchors appropriate for your wall type.",
  est_time_to_completion: "3 hours",
  user: user,
  is_favorite_project: false
}, user)

find_or_create_project('Home Decor', {
  title: "Hand-Painted Cushion Covers",
  description: "Customize your living space with hand-painted cushion covers. Use fabric paints or markers to create designs that match your decor.",
  instructions: "Choose plain cushion covers as your canvas. Sketch your design with a pencil. Paint your design with fabric paint or markers. Allow to dry completely before using.",
  est_time_to_completion: "2 hours (plus drying time)",
  user: user,
  is_favorite_project: false
}, user)

find_or_create_project('Upcycling', {
  title: "Wine Cork Board",
  description: "Turn your collection of wine corks into a functional and stylish cork board. Perfect for hanging notes, photos, or even jewelry.",
  instructions: "Arrange wine corks in a frame or on a flat surface to create your desired shape and size. Once satisfied with the layout, use a hot glue gun to secure the corks together and to the backing. Attach hanging hardware to the back if needed.",
  est_time_to_completion: "3 hours",
  user: user,
  is_favorite_project: false
}, user)

find_or_create_project('Upcycling', {
  title: "Mason Jar Herb Garden",
  description: "Repurpose old mason jars into a beautiful indoor herb garden. This project is not only decorative but also allows you to grow fresh herbs year-round.",
  instructions: "Fill the bottom of each mason jar with pebbles for drainage, then add potting soil and your choice of herb seeds or small plants. Place in a sunny spot and water regularly. Consider using a hanging shelf or wall mount for display.",
  est_time_to_completion: "1 hour (plus growing time)",
  user: user,
  is_favorite_project: false
}, user)

find_or_create_project('Upcycling', {
  title: "Tin Can Lanterns",
  description: "Transform empty tin cans into beautiful lanterns for your patio or garden with just a few simple steps.",
  instructions: "Remove labels and clean tin cans. Fill with water and freeze. Once frozen, use a hammer and nail to make designs. Thaw, dry, and paint the cans. Place candles inside and enjoy.",
  est_time_to_completion: "4 hours (including freezing time)",
  user: user,
  is_favorite_project: false
}, user)

find_or_create_project('Upcycling', {
  title: "Denim Tote Bag",
  description: "Repurpose old denim jeans into a stylish tote bag. A durable and fashionable way to recycle.",
  instructions: "Cut the legs off a pair of jeans. Sew the bottom shut. Create straps from the leg material or use a belt. Add pockets or decorations as desired.",
  est_time_to_completion: "3 hours",
  user: user,
  is_favorite_project: false
}, user)

find_or_create_project('DIY Furniture', {
  title: "Pallet Coffee Table",
  description: "Construct a unique coffee table using reclaimed pallet wood, adding a rustic charm to your living room.",
  instructions: "Disassemble a wooden pallet. Sand the wood to smooth out surfaces. Arrange the boards to form the tabletop and attach them together. Add legs using additional wood or pre-made legs. Finish with a stain or sealant.",
  est_time_to_completion: "5 hours",
  user: user,
  is_favorite_project: false
}, user)

find_or_create_project('DIY Furniture', {
  title: "Bookshelf from Crates",
  description: "Create a customizable bookshelf using wooden crates. This project allows for easy adjustment and addition of shelves.",
  instructions: "Collect or purchase several wooden crates. Sand and paint or stain the crates to your desired finish. Stack and secure the crates together in your preferred arrangement. Anchor the shelf to the wall for stability.",
  est_time_to_completion: "4 hours",
  user: user,
  is_favorite_project: false
}, user)

find_or_create_project('DIY Furniture', {
  title: "Floating Nightstand",
  description: "Maximize space with a minimalist floating nightstand. Perfect for small bedrooms.",
  instructions: "Cut a wooden board to your desired size for the nightstand. Sand and finish with paint or stain. Install brackets to the underside, ensuring they can support the weight. Mount securely to the wall beside your bed.",
  est_time_to_completion: "3 hours",
  user: user,
  is_favorite_project: false
}, user)

find_or_create_project('DIY Furniture', {
  title: "Pipe and Wood Desk",
  description: "Combine industrial pipes with wood to create a sturdy, stylish desk with character.",
  instructions: "Select your wood for the desktop and sand it smooth. Apply your chosen finish. Assemble the frame using metal pipes and fittings to create the legs and support structure. Attach the wood top to the frame.",
  est_time_to_completion: "6 hours",
  user: user,
  is_favorite_project: false
}, user)