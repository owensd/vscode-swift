import Vapor

let drop = Droplet()

drop.get("/hello") { _ in
    return "swift language service"
}

drop.run()