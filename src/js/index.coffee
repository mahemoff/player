 categoryData =
  animals: {
    name: "Animals",
    description: "All your favorites from aardvarks to zebras.",
    items: [
      {
        name: "Pets"
      },
      {
        name: "Farm Animals"
      },
      {
        name: "Wild Animals"
      }
    ]
  },
  colors: {
    name: "Colors",
    description: "Fresh colors from the magic rainbow.",
    items: [
      {
        name: "Blue"
      },
      {
        name: "Green"
      },
      {
        name: "Orange"
      },
      {
        name: "Purple"
      },
      {
        name: "Red"
      },
      {
        name: "Yellow"
      },
      {
        name: "Violet"
      }
    ]
  },
  vehicles: {
    name: "Vehicles",
    description: "Everything from cars to planes.",
    items: [
      {
        name: "Cars"
      },
      {
        name: "Planes"
      },
      {
        name: "Construction"
      }
    ]
  }

$(document).bind "pagebeforechange", ( e, data ) ->

  if ( typeof data.toPage === "string" ) {

      u = $.mobile.path.parseUrl( data.toPage ),
      re = /^#category-item/

    if ( u.hash.search(re) !== -1 ) {
      showCategory( u, data.options )
      e.preventDefault()
    }
  }
