import Vapor
import HTTP

extension Droplet {
    func setupRoutes() throws {
        get("hello") { req in
            var json = JSON()
            try json.set("hello", "world")
            return json
        }

        get("plaintext") { req in
            
            return "Hello, world!"
        }

        // response to requests to /info domain
        // with a description of the request
        get("info") { req in
            return req.description
        }
        
        post("hey") { req in
            
            print("This is the start of the print...")
            print(dump(req))
            
            return "what's good"
        }
        
        get("description") { req in return req.description }
        
        try resource("posts", PostController.self)
    }
}
