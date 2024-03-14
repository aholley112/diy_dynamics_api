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
    {
      category_name: 'Tech & Gadgets DIY',
    description: 'Dive into the world of technology with DIY projects. Build or enhance gadgets, explore robotics, create smart home devices, and more. Perfect for enthusiasts looking to combine creativity with tech.'
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
      p.category = category
    end
  
    if project.errors.any?
      puts "Project not created due to errors: #{project.errors.full_messages.join(", ")}"
    else
      project
    end
  end
  
  rock_painting = find_or_create_project('Kids Crafts', {
    title: "Rock Painting",
    description: "A simple and fun project for painting rocks. Great for kids to express their creativity.",
    instructions: "Collect some smooth rocks from outdoors, use acrylic paints to create designs.",
    est_time_to_completion: "2 hours",
    is_favorite_project: false
  }, user)
  
    rock_painting.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/rock_painting.jpeg"), filename: 'rock_painting.jpeg')
  
  finger_puppets = find_or_create_project('Kids Crafts', {
    title: "Finger Puppets",
    description: "Create your own set of fun and engaging finger puppets using felt and other materials.",
    instructions: "Cut felt into shapes of animals, glue parts together, and decorate.",
    est_time_to_completion: "1 hour",
    user: user,
    is_favorite_project: false
  }, user)

    finger_puppets.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/finger_puppets.jpg"), filename: 'finger_puppets.jpg')


  homemade_play_dough = find_or_create_project('Kids Crafts', {
    title: "Homemade Play Dough",
    description: "Create non-toxic, homemade play dough with just a few kitchen ingredients. A fun and safe craft for kids to sculpt and play with.",
    instructions: "Mix 2 cups of flour, 1/2 cup of salt, 2 tbsp of cream of tartar, 2 tbsp of vegetable oil, and 1 1/2 cups of boiling water. Add food coloring if desired. Knead until smooth.",
    est_time_to_completion: "1 hour",
    user: user,
    is_favorite_project: false
  }, user)

    homemade_play_dough.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/play_dough.jpeg"), filename: 'play_dough.jpeg')

  paper_plate_animals = find_or_create_project('Kids Crafts', {
    title: "Paper Plate Animals",
    description: "Craft cute animals using paper plates and basic art supplies. A creative and simple project for kids of all ages.",
    instructions: "Cut paper plates to shape and decorate with paint, markers, colored paper, and googly eyes to create various animals. Use glue to assemble pieces.",
    est_time_to_completion: "2 hours",
    user: user,
    is_favorite_project: false
  }, user)
  
    paper_plate_animals.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/paper_plate_animals.jpeg"), filename: 'paper_plate_animals.jpeg')

  
herb_garden = find_or_create_project('Gardening', {
  title: "Herb Garden",
  description: "Create your own herb garden with this simple project. Perfect for beginners!",
  instructions: "Choose a sunny spot, prepare the soil, plant herbs like basil, parsley, and mint, and ensure regular watering.",
  est_time_to_completion: "3 hours",
  user: user,
  is_favorite_project: false
}, user)

  herb_garden.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/herb_garden.jpeg"), filename: 'herb_garden.jpeg')

succulent_planter = find_or_create_project('Gardening', {
  title: "Succulent Planter",
  description: "Design a beautiful and low-maintenance succulent planter for your home or office.",
  instructions: "Select various succulents, prepare a planter with drainage, arrange the succulents, and add soil.",
  est_time_to_completion: "2 hours",
  user: user,
  is_favorite_project: false
}, user)

succulent_planter.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/succulent_planter1.avif"), filename: 'succulent_planter1.avif')


pollinator_garden = find_or_create_project('Gardening', {
  title: "Pollinator Garden",
  description: "Create a garden space dedicated to attracting and supporting pollinators like bees, butterflies, and hummingbirds. Choose plants that provide nectar and pollen throughout the growing season.",
  instructions: "Select a sunny location and prepare the soil. Plant a mix of native flowering plants that bloom at different times of the year. Include plants like lavender, bee balm, and milkweed. Add a water source, like a shallow birdbath.",
  est_time_to_completion: "5 hours",
  user: user,
  is_favorite_project: false
}, user)

pollinator_garden.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/pollinator_garden.jpeg"), filename: 'pollinator_garden.jpeg')

vegetable_container_garden = find_or_create_project('Gardening', {
  title: "Vegetable Container Garden",
  description: "Start a vegetable garden in containers, perfect for small spaces or urban gardening. Grow your own vegetables like tomatoes, peppers, and herbs.",
  instructions: "Choose containers with good drainage. Fill with high-quality potting soil. Plant seeds or seedlings for your chosen vegetables. Place in a location that receives at least 6 hours of sunlight daily. Water and fertilize as needed.",
  est_time_to_completion: "2 hours (plus growing season)",
  user: user,
  is_favorite_project: false
}, user)

vegetable_container_garden.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/vegetable_container_garden.jpeg"), filename: 'vegetable_container_garden.jpeg')

diy_superhero_cape = find_or_create_project('Costumes & Cosplay', {
  title: "DIY Superhero Cape",
  description: "Create your own superhero cape with customizable colors and symbols.",
  instructions: "Choose your fabric, cut out the cape shape, sew the edges, and add your unique symbol with fabric paint or patches.",
  est_time_to_completion: "4 hours",
  user: user,
  is_favorite_project: false
}, user)

diy_superhero_cape.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/diy_superhero_cape.jpeg"), filename: 'diy_superhero_cape.jpeg')

homemade_robot_costume = find_or_create_project('Costumes & Cosplay', {
  title: "Homemade Robot Costume",
  description: "Construct a futuristic robot costume using recycled materials.",
  instructions: "Collect boxes of various sizes, silver spray paint, and duct tape. Assemble the boxes into a body suit and headpiece, spray paint everything silver, and add details with markers or more tape.",
  est_time_to_completion: "5 hours",
  user: user,
  is_favorite_project: false
}, user)

homemade_robot_costume.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/homemade_robot_costume.jpeg"), filename: 'homemade_robot_costume.jpeg')


fairy_wings = find_or_create_project('Costumes & Cosplay', {
  title: "Fairy Wings",
  description: "Design and create magical fairy wings for costumes or dress-up play. Customize with colors and decorations.",
  instructions: "Use wire hangers to form the wing shape and cover with sheer fabric. Secure with tape and paint with glitter and decorations. Attach elastic bands to wear.",
  est_time_to_completion: "3 hours",
  user: user,
  is_favorite_project: false
}, user)

fairy_wings.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/fairy_wings.webp"), filename: 'fairy_wings.webp')


pirate_hat = find_or_create_project('Costumes & Cosplay', {
  title: "Pirate Hat",
  description: "Craft your own pirate hat with cardboard and basic crafting materials for a swashbuckling costume accessory.",
  instructions: "Cut cardboard into the shape of a pirate hat. Paint black and add a skull and crossbones design. Attach a bandana or fabric around the base for added flair.",
  est_time_to_completion: "2 hours",
  user: user,
  is_favorite_project: false
}, user)

pirate_hat.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/pirate_hat.webp"), filename: 'pirate_hat.webp')

simple_plant_cell_model = find_or_create_project('Biology for Kids', {
  title: "Simple Plant Cell Model",
  description: "Build a 3D model of a plant cell using household items to learn about cell structure.",
  instructions: "Use a large, clear plastic container as the cell. Fill it with gelatin for cytoplasm. Use fruits like grapes (chloroplasts), a large lima bean (nucleus), and yarn (endoplasmic reticulum) to represent cell parts.",
  est_time_to_completion: "2 hours",
  user: user,
  is_favorite_project: false
}, user)

simple_plant_cell_model.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/simple_plant_cell_model.png"), filename: 'simple_plant_cell_model.png')

backyard_bug_hunt = find_or_create_project('Biology for Kids', {
  title: "Backyard Bug Hunt",
  description: "Explore your backyard to find and identify different insects and learn about their habitats.",
  instructions: "Equip with a magnifying glass and a notebook. Gently catch insects using a net or by hand wearing gloves. Observe, identify, and release. Record your findings with drawings or photos.",
  est_time_to_completion: "3 hours",
  user: user,
  is_favorite_project: false
}, user)

backyard_bug_hunt.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/backyard_bug_hunt.jpeg"), filename: 'backyard_bug_hunt.jpeg')

diy_microscope_slides = find_or_create_project('Biology for Kids', {
  title: "DIY Microscope Slides",
  description: "Learn about the microscopic world by creating your own slides from household items or backyard finds.",
  instructions: "Collect thin, transparent objects like onion skin, leaves, or pond water. Place them on a glass slide and cover with a cover slip. Observe under a microscope.",
  est_time_to_completion: "1 hour",
  user: user,
  is_favorite_project: false
}, user)

diy_microscope_slides.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/diy_microscope_slides.jpeg"), filename: 'diy_microscope_slides.jpeg')

homemade_volcano_experiment = find_or_create_project('Biology for Kids', {
  title: "Homemade Volcano Experiment",
  description: "Understand chemical reactions by creating a homemade volcano that erupts with baking soda and vinegar.",
  instructions: "Build a volcano structure with clay or dirt. Create a cavity at the top and place a container inside. Mix baking soda, food coloring, and dish soap in the container. Pour vinegar to start the eruption.",
  est_time_to_completion: "2 hours",
  user: user,
  is_favorite_project: false
}, user)

homemade_volcano_experiment.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/homemade_volcano_experiment.jpeg"), filename: 'homemade_volcano_experiment.jpeg')


geometric_wall_art = find_or_create_project('Home Decor', {
  title: "Geometric Wall Art",
  description: "Create a stunning piece of geometric wall art using just painters tape and your choice of paint colors. This project can add a modern touch to any room in your home.",
  instructions: "Choose your canvas size. Apply painters tape in a geometric pattern across the canvas. Paint each section with your chosen colors. Once dry, carefully remove the tape to reveal your design. Mount your artwork on the wall with appropriate hanging materials.",
  est_time_to_completion: "4 hours",
  user: user,
  is_favorite_project: false
}, user)

geometric_wall_art.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/geometric_wall_art.webp"), filename: 'geometric_wall_art.webp')

diy_scented_candles = find_or_create_project('Home Decor', {
  title: "DIY Scented Candles",
  description: "Craft your own scented candles to cozy up your space or to give as thoughtful handmade gifts. Customize with your favorite scents and colors.",
  instructions: "Melt soy wax in a double boiler, add fragrance oils once melted, and dye if desired. Center the wick in a clean jar and carefully pour in the melted wax. Allow to cool and set completely before trimming the wick and using.",
  est_time_to_completion: "2 hours (plus cooling time)",
  user: user,
  is_favorite_project: false
}, user)

diy_scented_candles.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/diy_scented_candles.jpeg"), filename: 'diy_scented_candles.jpeg')

rustic_wood_shelf = find_or_create_project('Home Decor', {
  title: "Rustic Wood Shelf",
  description: "Create a rustic wood shelf for an elegant addition to any room, using reclaimed wood for a touch of charm.",
  instructions: "Select a piece of reclaimed wood and sand it down. Apply a finish of your choice. Attach brackets and mount the shelf to a wall with anchors appropriate for your wall type.",
  est_time_to_completion: "3 hours",
  user: user,
  is_favorite_project: false
}, user)

rustic_wood_shelf.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/rustic_wood_shelf.jpeg"), filename: 'rustic_wood_shelf.jpeg')


hand_painted_cushion_covers = find_or_create_project('Home Decor', {
  title: "Hand-Painted Cushion Covers",
  description: "Customize your living space with hand-painted cushion covers. Use fabric paints or markers to create designs that match your decor.",
  instructions: "Choose plain cushion covers as your canvas. Sketch your design with a pencil. Paint your design with fabric paint or markers. Allow to dry completely before using.",
  est_time_to_completion: "2 hours (plus drying time)",
  user: user,
  is_favorite_project: false
}, user)

hand_painted_cushion_covers.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/hand_painted_cushion_covers.jpeg"), filename: 'hand_painted_cushion_covers.jpeg')


wine_cork_board = find_or_create_project('Upcycling', {
  title: "Wine Cork Board",
  description: "Turn your collection of wine corks into a functional and stylish cork board. Perfect for hanging notes, photos, or even jewelry.",
  instructions: "Arrange wine corks in a frame or on a flat surface to create your desired shape and size. Once satisfied with the layout, use a hot glue gun to secure the corks together and to the backing. Attach hanging hardware to the back if needed.",
  est_time_to_completion: "3 hours",
  user: user,
  is_favorite_project: false
}, user)

wine_cork_board.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/wine_cork_board.jpeg"), filename: 'wine_cork_board.jpeg')


mason_jar_herb_garden = find_or_create_project('Upcycling', {
  title: "Mason Jar Herb Garden",
  description: "Repurpose old mason jars into a beautiful indoor herb garden. This project is not only decorative but also allows you to grow fresh herbs year-round.",
  instructions: "Fill the bottom of each mason jar with pebbles for drainage, then add potting soil and your choice of herb seeds or small plants. Place in a sunny spot and water regularly. Consider using a hanging shelf or wall mount for display.",
  est_time_to_completion: "1 hour (plus growing time)",
  user: user,
  is_favorite_project: false
}, user)

mason_jar_herb_garden.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/mason_jar_herb_garden.jpeg"), filename: 'mason_jar_herb_garden.jpeg')


tin_can_lanterns = find_or_create_project('Upcycling', {
  title: "Tin Can Lanterns",
  description: "Transform empty tin cans into beautiful lanterns for your patio or garden with just a few simple steps.",
  instructions: "Remove labels and clean tin cans. Fill with water and freeze. Once frozen, use a hammer and nail to make designs. Thaw, dry, and paint the cans. Place candles inside and enjoy.",
  est_time_to_completion: "4 hours (including freezing time)",
  user: user,
  is_favorite_project: false
}, user)

tin_can_lanterns.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/tin_can_lanterns.jpeg"), filename: 'tin_can_lanterns.jpeg')


denim_tote_bag = find_or_create_project('Upcycling', {
  title: "Denim Tote Bag",
  description: "Repurpose old denim jeans into a stylish tote bag. A durable and fashionable way to recycle.",
  instructions: "Cut the legs off a pair of jeans. Sew the bottom shut. Create straps from the leg material or use a belt. Add pockets or decorations as desired.",
  est_time_to_completion: "3 hours",
  user: user,
  is_favorite_project: false
}, user)

denim_tote_bag.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/denim_tote_bag.jpeg"), filename: 'denim_tote_bag.jpeg')


pallet_coffee_table = find_or_create_project('DIY Furniture', {
  title: "Pallet Coffee Table",
  description: "Construct a unique coffee table using reclaimed pallet wood, adding a rustic charm to your living room.",
  instructions: "Disassemble a wooden pallet. Sand the wood to smooth out surfaces. Arrange the boards to form the tabletop and attach them together. Add legs using additional wood or pre-made legs. Finish with a stain or sealant.",
  est_time_to_completion: "5 hours",
  user: user,
  is_favorite_project: false
}, user)

pallet_coffee_table.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/pallet_coffee_table.jpeg"), filename: 'pallet_coffee_table.jpeg')


bookshelf_from_crates = find_or_create_project('DIY Furniture', {
  title: "Bookshelf from Crates",
  description: "Create a customizable bookshelf using wooden crates. This project allows for easy adjustment and addition of shelves.",
  instructions: "Collect or purchase several wooden crates. Sand and paint or stain the crates to your desired finish. Stack and secure the crates together in your preferred arrangement. Anchor the shelf to the wall for stability.",
  est_time_to_completion: "4 hours",
  user: user,
  is_favorite_project: false
}, user)

bookshelf_from_crates.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/bookshelf_from_crates.jpeg"), filename: 'bookshelf_from_crates.jpeg')


floating_nightstand = find_or_create_project('DIY Furniture', {
  title: "Floating Nightstand",
  description: "Maximize space with a minimalist floating nightstand. Perfect for small bedrooms.",
  instructions: "Cut a wooden board to your desired size for the nightstand. Sand and finish with paint or stain. Install brackets to the underside, ensuring they can support the weight. Mount securely to the wall beside your bed.",
  est_time_to_completion: "3 hours",
  user: user,
  is_favorite_project: false
}, user)

floating_nightstand.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/floating_nightstand.jpeg"), filename: 'floating_nightstand.jpeg')


pipe_and_wood_desk = find_or_create_project('DIY Furniture', {
  title: "Pipe and Wood Desk",
  description: "Combine industrial pipes with wood to create a sturdy, stylish desk with character.",
  instructions: "Select your wood for the desktop and sand it smooth. Apply your chosen finish. Assemble the frame using metal pipes and fittings to create the legs and support structure. Attach the wood top to the frame.",
  est_time_to_completion: "6 hours",
  user: user,
  is_favorite_project: false
}, user)

pipe_and_wood_desk.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/pipe_and_wood_desk.jpeg"), filename: 'pipe_and_wood_desk.jpeg')


backsplash_tile_installation = find_or_create_project('DIY Home Improvement', {
  title: "Backsplash Tile Installation",
  description: "Transform your kitchen or bathroom with a new tile backsplash. This project can dramatically change the look of your space.",
  instructions: "Measure your space and select tiles. Apply tile adhesive to the wall, then press tiles in place. Use spacers to ensure even gaps. After the adhesive sets, apply grout between tiles, then clean and seal.",
  est_time_to_completion: "8 hours (over two days)",
  user: user,
  is_favorite_project: false
}, user)

backsplash_tile_installation.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/backsplash_tile_installation.webp"), filename: 'backsplash_tile_installation.webp')


custom_window_trim = find_or_create_project('DIY Home Improvement', {
  title: "Custom Window Trim",
  description: "Enhance your windows with custom trim, adding elegance and architectural interest to any room.",
  instructions: "Measure your windows and cut trim pieces to size. Sand, paint, or stain the trim as desired. Nail the trim in place around your windows, then caulk and paint any seams or nail holes.",
  est_time_to_completion: "4 hours",
  user: user,
  is_favorite_project: false
}, user)

custom_window_trim.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/custom_window_trim.jpeg"), filename: 'custom_window_trim.jpeg')


recessed_lighting_installation = find_or_create_project('DIY Home Improvement', {
  title: "Recessed Lighting Installation",
  description: "Brighten up your space with recessed lighting. This project involves electrical work, so ensure safety practices are followed.",
  instructions: "Plan your layout and mark the ceiling. Cut holes for the lights. Wire the lighting according to manufacturer instructions and local codes. Insert the lights into the holes and secure. Always turn off power when working with electricity.",
  est_time_to_completion: "8 hours",
  user: user,
  is_favorite_project: false
}, user)

recessed_lighting_installation.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/recessed_lighting_installation.jpeg"), filename: 'recessed_lighting_installation.jpeg')


refinishing_hardwood_floors = find_or_create_project('DIY Home Improvement', {
  title: "Refinishing Hardwood Floors",
  description: "Restore the beauty of your hardwood floors by refinishing them. This project can significantly improve the look of your home.",
  instructions: "Clear the room and sand the floors, starting with coarse-grit and moving to fine-grit sandpaper. Clean dust thoroughly. Apply stain if desired, then finish with a polyurethane sealant, following the product's directions for application and drying times.",
  est_time_to_completion: "48 hours (over several days)",
  user: user,
  is_favorite_project: false
}, user)

refinishing_hardwood_floors.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/refinishing_hardwood_floors.jpeg"), filename: 'refinishing_hardwood_floors.jpeg')


ombre_wall_painting = find_or_create_project('Painting & Decorating', {
  title: "Ombre Wall Painting",
  description: "Create a stunning ombre effect on your walls, blending colors seamlessly for a modern and stylish look.",
  instructions: "Choose two or three paint colors that blend well. Start with the lightest color at the top, applying it to about one-third of the wall. While still wet, blend the second color in the middle, using a dry brush to create a seamless transition. Repeat with the darkest color at the bottom.",
  est_time_to_completion: "6 hours",
  user: user,
  is_favorite_project: false
}, user)

ombre_wall_painting.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/ombre_wall_painting.jpeg"), filename: 'ombre_wall_painting.jpeg')


diy_canvas_art = find_or_create_project('Painting & Decorating', {
  title: "DIY Canvas Art",
  description: "Unleash your creativity by making your own canvas art. Use acrylics, oils, or mixed media to create artwork that complements your home decor.",
  instructions: "Stretch canvas over a frame or purchase a pre-stretched canvas. Sketch your design lightly with a pencil. Paint your masterpiece using your chosen medium. Allow to dry completely before hanging.",
  est_time_to_completion: "3 hours (plus drying time)",
  user: user,
  is_favorite_project: false
}, user)

diy_canvas_art.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/diy_canvas_art.webp"), filename: 'diy_canvas_art.webp')


stencil_accent_wall = find_or_create_project('Painting & Decorating', {
  title: "Stencil Accent Wall",
  description: "Transform a plain wall into a feature piece with stencils. Use geometric shapes, floral patterns, or your own designs for a custom look.",
  instructions: "Choose your stencil pattern and secure it to the wall with painter's tape. Apply paint with a roller or stencil brush. Carefully move and repeat the stencil to cover the desired area. Remove the stencil and touch up any edges.",
  est_time_to_completion: "5 hours",
  user: user,
  is_favorite_project: false
}, user)

stencil_accent_wall.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/stencil_accent_wall.jpeg"), filename: 'stencil_accent_wall.jpeg')


refurbished_vintage_frame = find_or_create_project('Painting & Decorating', {
  title: "Refurbished Vintage Frame",
  description: "Give old picture frames a new life with this refurbishing project. Perfect for adding a personal touch to your photos or artwork.",
  instructions: "Select a vintage frame and clean it thoroughly. Sand the frame lightly to prepare the surface. Paint or stain the frame in your chosen color. Once dry, add a sealant for durability. Insert your photo or art to display.",
  est_time_to_completion: "4 hours (plus drying time)",
  user: user,
  is_favorite_project: false
}, user)

refurbished_vintage_frame.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/refurbished_vintage_frame.jpeg"), filename: 'refurbished_vintage_frame.jpeg')

handmade_quilt = find_or_create_project('Sewing & Textiles', {
  title: "Handmade Quilt",
  description: "Create a cozy, handmade quilt using various fabrics. This project allows for personalization in pattern and color.",
  instructions: "Select fabrics and cut them into squares or rectangles. Arrange your pieces into a desired pattern. Sew the pieces together to form the top layer of the quilt. Attach batting and a backing layer, then quilt by sewing all layers together. Finish with binding around the edges.",
  est_time_to_completion: "20 hours",
  user: user,
  is_favorite_project: false
}, user)

handmade_quilt.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/handmade_quilt.jpg"), filename: 'handmade_quilt.jpg')


decorative_throw_pillows = find_or_create_project('Sewing & Textiles', {
  title: "Decorative Throw Pillows",
  description: "Sew decorative throw pillows to add a pop of color or texture to your living space. Choose from a variety of fabrics and designs.",
  instructions: "Cut fabric to your desired pillow size, adding seam allowances. Sew the pieces together, leaving an opening for stuffing. Turn the pillowcase right side out, stuff with filling, then sew the opening closed.",
  est_time_to_completion: "2 hours",
  user: user,
  is_favorite_project: false
}, user)

decorative_throw_pillows.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/decorative_throw_pillows.webp"), filename: 'decorative_throw_pillows.webp')


custom_tote_bag = find_or_create_project('Sewing & Textiles', {
  title: "Custom Tote Bag",
  description: "Design and sew your own tote bag, perfect for groceries, books, or everyday items. Personalize with pockets, fabric choices, and more.",
  instructions: "Cut two rectangles of fabric for the bag body and two strips for handles. Sew the sides and bottom of the bag. Fold and sew the top hem. Attach the handles by sewing them to the inside of the bag's top edge. Add pockets or decorations as desired.",
  est_time_to_completion: "3 hours",
  user: user,
  is_favorite_project: false
}, user)

custom_tote_bag.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/custom_tote_bags.jpeg"), filename: 'custom_tote_bags.jpeg')


embroidered_linen_napkins = find_or_create_project('Sewing & Textiles', {
  title: "Embroidered Linen Napkins",
  description: "Elevate your dining experience with embroidered linen napkins. Add monograms, designs, or colorful patterns.",
  instructions: "Cut linen fabric into squares of your desired napkin size, allowing for hemming. Hem the edges by folding them twice, ironing, and sewing in place. Use an embroidery hoop, needle, and floss to add your embroidery design to one corner of each napkin.",
  est_time_to_completion: "4 hours (per napkin)",
  user: user,
  is_favorite_project: false
}, user)

embroidered_linen_napkins.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/embroidered_linen_napkins.jpeg"), filename: 'embroidered_linen_napkins.jpeg')

beaded_charm_bracelet = find_or_create_project('Jewelry Making', {
  title: "Beaded Charm Bracelet",
  description: "Create a personalized beaded charm bracelet. Mix and match beads and charms for a unique piece of jewelry.",
  instructions: "Select beads and charms that fit your style. Using jewelry wire or elastic thread, string the beads and charms together. Use crimp beads to secure the ends, and add a clasp for closure on wire bracelets, or tie off elastic thread securely.",
  est_time_to_completion: "1 hour",
  user: user,
  is_favorite_project: false
}, user)

beaded_charm_bracelet.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/beaded_charm_bracelet.webp"), filename: 'beaded_charm_bracelet.webp')


handmade_statement_necklace = find_or_create_project('Jewelry Making', {
  title: "Handmade Statement Necklace",
  description: "Craft a bold statement necklace using a variety of materials such as beads, chains, and pendants.",
  instructions: "Design your necklace layout. String beads or attach pendants to your base chain, adjusting the length to your preference. Use jump rings to add layers or additional chains. Ensure all connections are secure.",
  est_time_to_completion: "2 hours",
  user: user,
  is_favorite_project: false
}, user)

handmade_statement_necklace.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/handmade_statement_necklace.webp"), filename: 'handmade_statement_necklace.webp')


wire_wrapped_rings = find_or_create_project('Jewelry Making', {
  title: "Wire Wrapped Rings",
  description: "Fashion unique rings using wire wrapping techniques. Incorporate stones, beads, or crystals for decoration.",
  instructions: "Choose a bead or stone as the centerpiece. Cut a length of jewelry wire and wrap it around a mandrel to form the ring shape. Secure the bead or stone by wrapping it with wire, creating a secure hold and decorative pattern.",
  est_time_to_completion: "30 minutes",
  user: user,
  is_favorite_project: false
}, user)

wire_wrapped_rings.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/wire_wrapped_rings.avif"), filename: 'wire_wrapped_rings.avif')


leather_cuff_bracelet = find_or_create_project('Jewelry Making', {
  title: "Leather Cuff Bracelet",
  description: "Make a stylish leather cuff bracelet. Customize with stamps, paint, or stitching for a personalized touch.",
  instructions: "Cut a strip of leather to your desired width and length for the cuff. Use leather stamps or paint to add designs. If desired, add stitching along the edges for detail. Punch holes at both ends and add a button stud or snaps for closure.",
  est_time_to_completion: "3 hours",
  user: user,
  is_favorite_project: false
}, user)

leather_cuff_bracelet.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/leather_cuff_bracelet.jpeg"), filename: 'leather_cuff_bracelet.jpeg')


hand_built_clay_mugs = find_or_create_project('Pottery & Ceramics', {
  title: "Hand-Built Clay Mugs",
  description: "Create unique clay mugs using hand-building techniques. Personalize with textures and glazes.",
  instructions: "Roll out clay to an even thickness. Cut a rectangle for the body and a strip for the handle. Wrap the rectangle into a cylinder and join the edges. Attach the handle. Bisque fire, apply glaze, and glaze fire.",
  est_time_to_completion: "4 hours (plus drying and firing time)",
  user: user,
  is_favorite_project: false
}, user)

hand_built_clay_mugs.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/hand_built_clay_mugs.avif"), filename: 'hand_built_clay_mugs.avif')

ceramic_tile_coasters = find_or_create_project('Pottery & Ceramics', {
  title: "Ceramic Tile Coasters",
  description: "Design and create ceramic tile coasters. Customize with glazes or ceramic decals for a unique finish.",
  instructions: "Roll out clay and cut into squares for coasters. Smooth edges and let dry. Bisque fire the tiles. Apply glaze or decals and glaze fire for a glossy finish. Add cork or felt to the bottom to prevent slipping.",
  est_time_to_completion: "3 hours (plus drying and firing time)",
  user: user,
  is_favorite_project: false
}, user)

ceramic_tile_coasters.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/ceramic_tile_coasters.webp"), filename: 'ceramic_tile_coasters.webp')


sculptural_vases = find_or_create_project('Pottery & Ceramics', {
  title: "Sculptural Vases",
  description: "Explore sculptural forms by creating vases with organic shapes and textures. Experiment with different clay bodies and finishes.",
  instructions: "Use coils, slabs, or pinching methods to form your vase. Incorporate textures using stamps, carving, or added clay elements. Allow to dry, then bisque fire. Apply oxides, underglazes, and glazes to enhance texture. Glaze fire.",
  est_time_to_completion: "5 hours (plus drying and firing time)",
  user: user,
  is_favorite_project: false
}, user)

sculptural_vases.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/sculptural_vases.webp"), filename: 'sculptural_vases.webp')


decorative_wall_plates = find_or_create_project('Pottery & Ceramics', {
  title: "Decorative Wall Plates",
  description: "Make decorative ceramic plates to hang on the wall. Use sgraffito, mishima, or underglaze painting techniques for decoration.",
  instructions: "Throw or hand-build a flat plate with a rolled-out slab of clay. Once leather-hard, sketch your design. Apply underglazes or slip. Carve or incise to reveal the design (sgraffito) or fill incised lines with contrasting slip (mishima). Bisque fire, clear glaze, and glaze fire.",
  est_time_to_completion: "6 hours (plus drying and firing time)",
  user: user,
  is_favorite_project: false
}, user)

decorative_wall_plates.image.attach(io: File.open("/Users/amandafeely/Documents/diy_images/decorative_wall_plates.avif"), filename: 'decorative_wall_plates.avif')

find_or_create_project('Paper Crafts', {
  title: "Origami Paper Cranes",
  description: "Master the art of origami by folding paper cranes. This traditional craft symbolizes peace and happiness.",
  instructions: "Start with a square sheet of origami paper. Follow a series of folds to create the crane shape. Pull the wings gently apart to inflate the body. Experiment with different paper sizes and colors.",
  est_time_to_completion: "30 minutes",
  user: user,
  is_favorite_project: false
}, user)

find_or_create_project('Paper Crafts', {
  title: "Handmade Greeting Cards",
  description: "Create personalized greeting cards using card stock, decorative paper, and embellishments. Perfect for any occasion.",
  instructions: "Cut card stock to your desired size. Decorate with layers of decorative paper, stamps, stickers, and handwritten messages. Add special touches like ribbon or glitter for a festive look.",
  est_time_to_completion: "1 hour",
  user: user,
  is_favorite_project: false
}, user)

find_or_create_project('Paper Crafts', {
  title: "Scrapbook Album",
  description: "Preserve your memories in a handmade scrapbook album. Combine photos, ticket stubs, and other memorabilia with creative embellishments.",
  instructions: "Select an album or create your own with card stock. Design each page around a theme or event, adding photos and items. Decorate with stickers, cutouts, and journaling to tell the story.",
  est_time_to_completion: "Varies",
  user: user,
  is_favorite_project: false
}, user)

find_or_create_project('Paper Crafts', {
  title: "Paper Mache Sculptures",
  description: "Use the paper mache technique to create sculptures or decorative objects. A fun and messy project suitable for all ages.",
  instructions: "Tear strips of newspaper. Mix flour and water to make paste. Dip the strips into the paste, then layer over a form or balloon. Let dry completely, then paint or decorate as desired.",
  est_time_to_completion: "2 days (including drying time)",
  user: user,
  is_favorite_project: false
}, user)

find_or_create_project('Cooking & Baking', {
  title: "Artisan Sourdough Bread",
  description: "Bake your own artisan sourdough bread from scratch. Learn to create and maintain a sourdough starter for bakery-quality bread at home.",
  instructions: "Mix flour and water to create a sourdough starter. Feed it daily for at least 5 days. Once mature, mix your starter with flour, water, and salt to form the dough. Fold and shape, then let it rise. Bake in a preheated oven with steam.",
  est_time_to_completion: "7 days for starter, 24 hours for bread",
  user: user,
  is_favorite_project: false
}, user)

find_or_create_project('Cooking & Baking', {
  title: "Homemade Pasta",
  description: "Learn the art of making homemade pasta. Roll out your own noodles for a fresh and delicious meal.",
  instructions: "Combine flour and eggs to create a pasta dough. Knead until smooth. Let rest, then roll out to desired thickness. Cut into shapes or noodles. Boil in salted water until al dente. Serve with your favorite sauce.",
  est_time_to_completion: "2 hours",
  user: user,
  is_favorite_project: false
}, user)

find_or_create_project('Cooking & Baking', {
  title: "French Macarons",
  description: "Master the delicate process of making French macarons. Choose your favorite fillings and colors for these elegant treats.",
  instructions: "Sift almond flour and powdered sugar. Whip egg whites and gradually add granulated sugar until stiff peaks form. Fold in the almond mixture. Pipe onto baking sheets. Let skin form before baking. Once cooled, fill with buttercream or ganache.",
  est_time_to_completion: "3 hours",
  user: user,
  is_favorite_project: false
}, user)

find_or_create_project('Cooking & Baking', {
  title: "Decadent Chocolate Truffles",
  description: "Create rich, decadent chocolate truffles with a variety of coatings. A perfect gift or treat for any chocolate lover.",
  instructions: "Heat cream and pour over chopped chocolate. Stir until smooth. Chill until set, then scoop and roll into balls. Coat with cocoa powder, nuts, or tempered chocolate. Let set before serving.",
  est_time_to_completion: "2 hours (plus chilling time)",
  user: user,
  is_favorite_project: false
}, user)

find_or_create_project('Woodworking', {
  title: "Simple Birdhouse",
  description: "Build a simple birdhouse to welcome feathered friends to your garden. This project is great for beginners and can be customized with paint or decorations.",
  instructions: "Cut wood panels to size for the sides, bottom, roof, and entrance. Assemble using nails or screws. Drill an entrance hole. Optionally, paint or decorate the birdhouse. Mount it in a suitable location.",
  est_time_to_completion: "2 hours",
  user: user,
  is_favorite_project: false
}, user)

find_or_create_project('Woodworking', {
  title: "Custom Cutting Board",
  description: "Craft a custom cutting board from hardwood. Choose woods of different colors for a striped or checkered pattern.",
  instructions: "Select and cut hardwood strips to desired dimensions. Glue the strips side by side, clamping them tightly. Once dry, plane or sand the surface smooth. Cut to final size, round the edges, and apply a food-safe finish.",
  est_time_to_completion: "5 hours (plus drying time)",
  user: user,
  is_favorite_project: false
}, user)

find_or_create_project('Woodworking', {
  title: "Floating Shelves",
  description: "Add storage and display space to any room with custom floating shelves. These sleek, modern shelves appear to 'float' without visible supports.",
  instructions: "Cut wood to your desired shelf length. Construct a hollow box or use solid wood for a simpler version. For the hidden bracket, attach a frame to the wall studs. Slide the shelf over the frame and secure. Finish with paint or stain.",
  est_time_to_completion: "4 hours",
  user: user,
  is_favorite_project: false
}, user)

find_or_create_project('Woodworking', {
  title: "Planter Box",
  description: "Create a sturdy wooden planter box for flowers or vegetables. Customize the size to fit your space.",
  instructions: "Cut wood planks and assemble into a box shape using screws or nails. Drill drainage holes in the bottom. Add feet or casters for mobility. Line with landscape fabric and fill with potting soil before planting.",
  est_time_to_completion: "3 hours",
  user: user,
  is_favorite_project: false
}, user)
