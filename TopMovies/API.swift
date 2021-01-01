// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class MoviesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Movies($firstNumberOfMovies: Int!, $endCursor: String) {
      movies {
        __typename
        popular(first: $firstNumberOfMovies, after: $endCursor) {
          __typename
          pageInfo {
            __typename
            hasNextPage
            endCursor
            startCursor
          }
          totalCount
          edges {
            __typename
            node {
              __typename
              id
              title
              overview
              rating
              releaseDate
              details {
                __typename
                imdbID
                homepage
                runtime
                budget
                similar(first: 10) {
                  __typename
                  edges {
                    __typename
                    node {
                      __typename
                      details {
                        __typename
                        imdbID
                      }
                    }
                  }
                }
                genres {
                  __typename
                  name
                }
              }
              poster(size: W780)
              images {
                __typename
                posters {
                  __typename
                  image(size: W780)
                }
              }
            }
          }
        }
      }
    }
    """

  public let operationName: String = "Movies"

  public var firstNumberOfMovies: Int
  public var endCursor: String?

  public init(firstNumberOfMovies: Int, endCursor: String? = nil) {
    self.firstNumberOfMovies = firstNumberOfMovies
    self.endCursor = endCursor
  }

  public var variables: GraphQLMap? {
    return ["firstNumberOfMovies": firstNumberOfMovies, "endCursor": endCursor]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("movies", type: .nonNull(.object(Movie.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(movies: Movie) {
      self.init(unsafeResultMap: ["__typename": "Query", "movies": movies.resultMap])
    }

    public var movies: Movie {
      get {
        return Movie(unsafeResultMap: resultMap["movies"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "movies")
      }
    }

    public struct Movie: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Movies"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("popular", arguments: ["first": GraphQLVariable("firstNumberOfMovies"), "after": GraphQLVariable("endCursor")], type: .nonNull(.object(Popular.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(popular: Popular) {
        self.init(unsafeResultMap: ["__typename": "Movies", "popular": popular.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var popular: Popular {
        get {
          return Popular(unsafeResultMap: resultMap["popular"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "popular")
        }
      }

      public struct Popular: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MovieConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
            GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
            GraphQLField("edges", type: .list(.object(Edge.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(pageInfo: PageInfo, totalCount: Int, edges: [Edge?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "MovieConnection", "pageInfo": pageInfo.resultMap, "totalCount": totalCount, "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var pageInfo: PageInfo {
          get {
            return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
          }
        }

        public var totalCount: Int {
          get {
            return resultMap["totalCount"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "totalCount")
          }
        }

        public var edges: [Edge?]? {
          get {
            return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
          }
        }

        public struct PageInfo: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["PageInfo"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
              GraphQLField("endCursor", type: .scalar(String.self)),
              GraphQLField("startCursor", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(hasNextPage: Bool, endCursor: String? = nil, startCursor: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "PageInfo", "hasNextPage": hasNextPage, "endCursor": endCursor, "startCursor": startCursor])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var hasNextPage: Bool {
            get {
              return resultMap["hasNextPage"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "hasNextPage")
            }
          }

          public var endCursor: String? {
            get {
              return resultMap["endCursor"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "endCursor")
            }
          }

          public var startCursor: String? {
            get {
              return resultMap["startCursor"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "startCursor")
            }
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["MovieEdge"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("node", type: .object(Node.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(node: Node? = nil) {
            self.init(unsafeResultMap: ["__typename": "MovieEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var node: Node? {
            get {
              return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "node")
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["MovieResult", "DetailedMovie", "Movie"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                GraphQLField("title", type: .nonNull(.scalar(String.self))),
                GraphQLField("overview", type: .nonNull(.scalar(String.self))),
                GraphQLField("rating", type: .nonNull(.scalar(Double.self))),
                GraphQLField("releaseDate", type: .scalar(String.self)),
                GraphQLField("details", type: .nonNull(.object(Detail.selections))),
                GraphQLField("poster", arguments: ["size": "W780"], type: .scalar(String.self)),
                GraphQLField("images", type: .nonNull(.object(Image.selections))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public static func makeMovieResult(id: Int, title: String, overview: String, rating: Double, releaseDate: String? = nil, details: Detail, poster: String? = nil, images: Image) -> Node {
              return Node(unsafeResultMap: ["__typename": "MovieResult", "id": id, "title": title, "overview": overview, "rating": rating, "releaseDate": releaseDate, "details": details.resultMap, "poster": poster, "images": images.resultMap])
            }

            public static func makeDetailedMovie(id: Int, title: String, overview: String, rating: Double, releaseDate: String? = nil, details: Detail, poster: String? = nil, images: Image) -> Node {
              return Node(unsafeResultMap: ["__typename": "DetailedMovie", "id": id, "title": title, "overview": overview, "rating": rating, "releaseDate": releaseDate, "details": details.resultMap, "poster": poster, "images": images.resultMap])
            }

            public static func makeMovie(id: Int, title: String, overview: String, rating: Double, releaseDate: String? = nil, details: Detail, poster: String? = nil, images: Image) -> Node {
              return Node(unsafeResultMap: ["__typename": "Movie", "id": id, "title": title, "overview": overview, "rating": rating, "releaseDate": releaseDate, "details": details.resultMap, "poster": poster, "images": images.resultMap])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: Int {
              get {
                return resultMap["id"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var title: String {
              get {
                return resultMap["title"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "title")
              }
            }

            public var overview: String {
              get {
                return resultMap["overview"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "overview")
              }
            }

            public var rating: Double {
              get {
                return resultMap["rating"]! as! Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "rating")
              }
            }

            public var releaseDate: String? {
              get {
                return resultMap["releaseDate"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "releaseDate")
              }
            }

            public var details: Detail {
              get {
                return Detail(unsafeResultMap: resultMap["details"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "details")
              }
            }

            public var poster: String? {
              get {
                return resultMap["poster"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "poster")
              }
            }

            public var images: Image {
              get {
                return Image(unsafeResultMap: resultMap["images"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "images")
              }
            }

            public struct Detail: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["DetailedMovie"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("imdbID", type: .nonNull(.scalar(String.self))),
                  GraphQLField("homepage", type: .scalar(String.self)),
                  GraphQLField("runtime", type: .nonNull(.scalar(Int.self))),
                  GraphQLField("budget", type: .scalar(Int.self)),
                  GraphQLField("similar", arguments: ["first": 10], type: .nonNull(.object(Similar.selections))),
                  GraphQLField("genres", type: .nonNull(.list(.nonNull(.object(Genre.selections))))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(imdbId: String, homepage: String? = nil, runtime: Int, budget: Int? = nil, similar: Similar, genres: [Genre]) {
                self.init(unsafeResultMap: ["__typename": "DetailedMovie", "imdbID": imdbId, "homepage": homepage, "runtime": runtime, "budget": budget, "similar": similar.resultMap, "genres": genres.map { (value: Genre) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var imdbId: String {
                get {
                  return resultMap["imdbID"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "imdbID")
                }
              }

              public var homepage: String? {
                get {
                  return resultMap["homepage"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "homepage")
                }
              }

              public var runtime: Int {
                get {
                  return resultMap["runtime"]! as! Int
                }
                set {
                  resultMap.updateValue(newValue, forKey: "runtime")
                }
              }

              public var budget: Int? {
                get {
                  return resultMap["budget"] as? Int
                }
                set {
                  resultMap.updateValue(newValue, forKey: "budget")
                }
              }

              public var similar: Similar {
                get {
                  return Similar(unsafeResultMap: resultMap["similar"]! as! ResultMap)
                }
                set {
                  resultMap.updateValue(newValue.resultMap, forKey: "similar")
                }
              }

              public var genres: [Genre] {
                get {
                  return (resultMap["genres"] as! [ResultMap]).map { (value: ResultMap) -> Genre in Genre(unsafeResultMap: value) }
                }
                set {
                  resultMap.updateValue(newValue.map { (value: Genre) -> ResultMap in value.resultMap }, forKey: "genres")
                }
              }

              public struct Similar: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["MovieConnection"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("edges", type: .list(.object(Edge.selections))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(edges: [Edge?]? = nil) {
                  self.init(unsafeResultMap: ["__typename": "MovieConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var edges: [Edge?]? {
                  get {
                    return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
                  }
                  set {
                    resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
                  }
                }

                public struct Edge: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["MovieEdge"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("node", type: .object(Node.selections)),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(node: Node? = nil) {
                    self.init(unsafeResultMap: ["__typename": "MovieEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  public var node: Node? {
                    get {
                      return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
                    }
                    set {
                      resultMap.updateValue(newValue?.resultMap, forKey: "node")
                    }
                  }

                  public struct Node: GraphQLSelectionSet {
                    public static let possibleTypes: [String] = ["MovieResult", "DetailedMovie", "Movie"]

                    public static var selections: [GraphQLSelection] {
                      return [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                        GraphQLField("details", type: .nonNull(.object(Detail.selections))),
                      ]
                    }

                    public private(set) var resultMap: ResultMap

                    public init(unsafeResultMap: ResultMap) {
                      self.resultMap = unsafeResultMap
                    }

                    public static func makeMovieResult(details: Detail) -> Node {
                      return Node(unsafeResultMap: ["__typename": "MovieResult", "details": details.resultMap])
                    }

                    public static func makeDetailedMovie(details: Detail) -> Node {
                      return Node(unsafeResultMap: ["__typename": "DetailedMovie", "details": details.resultMap])
                    }

                    public static func makeMovie(details: Detail) -> Node {
                      return Node(unsafeResultMap: ["__typename": "Movie", "details": details.resultMap])
                    }

                    public var __typename: String {
                      get {
                        return resultMap["__typename"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                      }
                    }

                    public var details: Detail {
                      get {
                        return Detail(unsafeResultMap: resultMap["details"]! as! ResultMap)
                      }
                      set {
                        resultMap.updateValue(newValue.resultMap, forKey: "details")
                      }
                    }

                    public struct Detail: GraphQLSelectionSet {
                      public static let possibleTypes: [String] = ["DetailedMovie"]

                      public static var selections: [GraphQLSelection] {
                        return [
                          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                          GraphQLField("imdbID", type: .nonNull(.scalar(String.self))),
                        ]
                      }

                      public private(set) var resultMap: ResultMap

                      public init(unsafeResultMap: ResultMap) {
                        self.resultMap = unsafeResultMap
                      }

                      public init(imdbId: String) {
                        self.init(unsafeResultMap: ["__typename": "DetailedMovie", "imdbID": imdbId])
                      }

                      public var __typename: String {
                        get {
                          return resultMap["__typename"]! as! String
                        }
                        set {
                          resultMap.updateValue(newValue, forKey: "__typename")
                        }
                      }

                      public var imdbId: String {
                        get {
                          return resultMap["imdbID"]! as! String
                        }
                        set {
                          resultMap.updateValue(newValue, forKey: "imdbID")
                        }
                      }
                    }
                  }
                }
              }

              public struct Genre: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Genre"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("name", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(name: String) {
                  self.init(unsafeResultMap: ["__typename": "Genre", "name": name])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var name: String {
                  get {
                    return resultMap["name"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "name")
                  }
                }
              }
            }

            public struct Image: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["MediaImages"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("posters", type: .nonNull(.list(.nonNull(.object(Poster.selections))))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(posters: [Poster]) {
                self.init(unsafeResultMap: ["__typename": "MediaImages", "posters": posters.map { (value: Poster) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var posters: [Poster] {
                get {
                  return (resultMap["posters"] as! [ResultMap]).map { (value: ResultMap) -> Poster in Poster(unsafeResultMap: value) }
                }
                set {
                  resultMap.updateValue(newValue.map { (value: Poster) -> ResultMap in value.resultMap }, forKey: "posters")
                }
              }

              public struct Poster: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["PosterSizeDetailImage"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("image", arguments: ["size": "W780"], type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(image: String) {
                  self.init(unsafeResultMap: ["__typename": "PosterSizeDetailImage", "image": image])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var image: String {
                  get {
                    return resultMap["image"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "image")
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class FindByImdbIdQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query findByImdbID($ImdbId: String!) {
      find(externalId: $ImdbId, source: Imdb) {
        __typename
        movies {
          __typename
          id
          title
          overview
          rating
          releaseDate
          details {
            __typename
            imdbID
            homepage
            runtime
            budget
            similar(first: 10) {
              __typename
              edges {
                __typename
                node {
                  __typename
                  details {
                    __typename
                    imdbID
                  }
                }
              }
            }
            genres {
              __typename
              name
            }
          }
          poster(size: W780)
          images {
            __typename
            posters {
              __typename
              image(size: W780)
            }
          }
        }
      }
    }
    """

  public let operationName: String = "findByImdbID"

  public var ImdbId: String

  public init(ImdbId: String) {
    self.ImdbId = ImdbId
  }

  public var variables: GraphQLMap? {
    return ["ImdbId": ImdbId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("find", arguments: ["externalId": GraphQLVariable("ImdbId"), "source": "Imdb"], type: .nonNull(.object(Find.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(find: Find) {
      self.init(unsafeResultMap: ["__typename": "Query", "find": find.resultMap])
    }

    public var find: Find {
      get {
        return Find(unsafeResultMap: resultMap["find"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "find")
      }
    }

    public struct Find: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["FromExternalIds"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("movies", type: .nonNull(.list(.nonNull(.object(Movie.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(movies: [Movie]) {
        self.init(unsafeResultMap: ["__typename": "FromExternalIds", "movies": movies.map { (value: Movie) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var movies: [Movie] {
        get {
          return (resultMap["movies"] as! [ResultMap]).map { (value: ResultMap) -> Movie in Movie(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Movie) -> ResultMap in value.resultMap }, forKey: "movies")
        }
      }

      public struct Movie: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MovieResult", "DetailedMovie", "Movie"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
            GraphQLField("overview", type: .nonNull(.scalar(String.self))),
            GraphQLField("rating", type: .nonNull(.scalar(Double.self))),
            GraphQLField("releaseDate", type: .scalar(String.self)),
            GraphQLField("details", type: .nonNull(.object(Detail.selections))),
            GraphQLField("poster", arguments: ["size": "W780"], type: .scalar(String.self)),
            GraphQLField("images", type: .nonNull(.object(Image.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public static func makeMovieResult(id: Int, title: String, overview: String, rating: Double, releaseDate: String? = nil, details: Detail, poster: String? = nil, images: Image) -> Movie {
          return Movie(unsafeResultMap: ["__typename": "MovieResult", "id": id, "title": title, "overview": overview, "rating": rating, "releaseDate": releaseDate, "details": details.resultMap, "poster": poster, "images": images.resultMap])
        }

        public static func makeDetailedMovie(id: Int, title: String, overview: String, rating: Double, releaseDate: String? = nil, details: Detail, poster: String? = nil, images: Image) -> Movie {
          return Movie(unsafeResultMap: ["__typename": "DetailedMovie", "id": id, "title": title, "overview": overview, "rating": rating, "releaseDate": releaseDate, "details": details.resultMap, "poster": poster, "images": images.resultMap])
        }

        public static func makeMovie(id: Int, title: String, overview: String, rating: Double, releaseDate: String? = nil, details: Detail, poster: String? = nil, images: Image) -> Movie {
          return Movie(unsafeResultMap: ["__typename": "Movie", "id": id, "title": title, "overview": overview, "rating": rating, "releaseDate": releaseDate, "details": details.resultMap, "poster": poster, "images": images.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var title: String {
          get {
            return resultMap["title"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        public var overview: String {
          get {
            return resultMap["overview"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "overview")
          }
        }

        public var rating: Double {
          get {
            return resultMap["rating"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "rating")
          }
        }

        public var releaseDate: String? {
          get {
            return resultMap["releaseDate"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "releaseDate")
          }
        }

        public var details: Detail {
          get {
            return Detail(unsafeResultMap: resultMap["details"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "details")
          }
        }

        public var poster: String? {
          get {
            return resultMap["poster"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "poster")
          }
        }

        public var images: Image {
          get {
            return Image(unsafeResultMap: resultMap["images"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "images")
          }
        }

        public struct Detail: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["DetailedMovie"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("imdbID", type: .nonNull(.scalar(String.self))),
              GraphQLField("homepage", type: .scalar(String.self)),
              GraphQLField("runtime", type: .nonNull(.scalar(Int.self))),
              GraphQLField("budget", type: .scalar(Int.self)),
              GraphQLField("similar", arguments: ["first": 10], type: .nonNull(.object(Similar.selections))),
              GraphQLField("genres", type: .nonNull(.list(.nonNull(.object(Genre.selections))))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(imdbId: String, homepage: String? = nil, runtime: Int, budget: Int? = nil, similar: Similar, genres: [Genre]) {
            self.init(unsafeResultMap: ["__typename": "DetailedMovie", "imdbID": imdbId, "homepage": homepage, "runtime": runtime, "budget": budget, "similar": similar.resultMap, "genres": genres.map { (value: Genre) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var imdbId: String {
            get {
              return resultMap["imdbID"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "imdbID")
            }
          }

          public var homepage: String? {
            get {
              return resultMap["homepage"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "homepage")
            }
          }

          public var runtime: Int {
            get {
              return resultMap["runtime"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "runtime")
            }
          }

          public var budget: Int? {
            get {
              return resultMap["budget"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "budget")
            }
          }

          public var similar: Similar {
            get {
              return Similar(unsafeResultMap: resultMap["similar"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "similar")
            }
          }

          public var genres: [Genre] {
            get {
              return (resultMap["genres"] as! [ResultMap]).map { (value: ResultMap) -> Genre in Genre(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: Genre) -> ResultMap in value.resultMap }, forKey: "genres")
            }
          }

          public struct Similar: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["MovieConnection"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("edges", type: .list(.object(Edge.selections))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(edges: [Edge?]? = nil) {
              self.init(unsafeResultMap: ["__typename": "MovieConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var edges: [Edge?]? {
              get {
                return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
              }
              set {
                resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
              }
            }

            public struct Edge: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["MovieEdge"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("node", type: .object(Node.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(node: Node? = nil) {
                self.init(unsafeResultMap: ["__typename": "MovieEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var node: Node? {
                get {
                  return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "node")
                }
              }

              public struct Node: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["MovieResult", "DetailedMovie", "Movie"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("details", type: .nonNull(.object(Detail.selections))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeMovieResult(details: Detail) -> Node {
                  return Node(unsafeResultMap: ["__typename": "MovieResult", "details": details.resultMap])
                }

                public static func makeDetailedMovie(details: Detail) -> Node {
                  return Node(unsafeResultMap: ["__typename": "DetailedMovie", "details": details.resultMap])
                }

                public static func makeMovie(details: Detail) -> Node {
                  return Node(unsafeResultMap: ["__typename": "Movie", "details": details.resultMap])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var details: Detail {
                  get {
                    return Detail(unsafeResultMap: resultMap["details"]! as! ResultMap)
                  }
                  set {
                    resultMap.updateValue(newValue.resultMap, forKey: "details")
                  }
                }

                public struct Detail: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["DetailedMovie"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("imdbID", type: .nonNull(.scalar(String.self))),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(imdbId: String) {
                    self.init(unsafeResultMap: ["__typename": "DetailedMovie", "imdbID": imdbId])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  public var imdbId: String {
                    get {
                      return resultMap["imdbID"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "imdbID")
                    }
                  }
                }
              }
            }
          }

          public struct Genre: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Genre"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String) {
              self.init(unsafeResultMap: ["__typename": "Genre", "name": name])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }
          }
        }

        public struct Image: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["MediaImages"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("posters", type: .nonNull(.list(.nonNull(.object(Poster.selections))))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(posters: [Poster]) {
            self.init(unsafeResultMap: ["__typename": "MediaImages", "posters": posters.map { (value: Poster) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var posters: [Poster] {
            get {
              return (resultMap["posters"] as! [ResultMap]).map { (value: ResultMap) -> Poster in Poster(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: Poster) -> ResultMap in value.resultMap }, forKey: "posters")
            }
          }

          public struct Poster: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["PosterSizeDetailImage"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("image", arguments: ["size": "W780"], type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(image: String) {
              self.init(unsafeResultMap: ["__typename": "PosterSizeDetailImage", "image": image])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var image: String {
              get {
                return resultMap["image"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "image")
              }
            }
          }
        }
      }
    }
  }
}

public final class TopRatedMoviesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query topRatedMovies($firstNumberOfMovies: Int!, $endCursor: String) {
      movies {
        __typename
        topRated(first: $firstNumberOfMovies, after: $endCursor) {
          __typename
          pageInfo {
            __typename
            hasNextPage
            endCursor
            startCursor
          }
          totalCount
          edges {
            __typename
            node {
              __typename
              id
              title
              overview
              rating
              releaseDate
              details {
                __typename
                imdbID
                homepage
                runtime
                budget
                similar(first: 10) {
                  __typename
                  edges {
                    __typename
                    node {
                      __typename
                      details {
                        __typename
                        imdbID
                      }
                    }
                  }
                }
                genres {
                  __typename
                  name
                }
              }
              poster(size: W780)
              images {
                __typename
                posters {
                  __typename
                  image(size: W780)
                }
              }
            }
          }
        }
      }
    }
    """

  public let operationName: String = "topRatedMovies"

  public var firstNumberOfMovies: Int
  public var endCursor: String?

  public init(firstNumberOfMovies: Int, endCursor: String? = nil) {
    self.firstNumberOfMovies = firstNumberOfMovies
    self.endCursor = endCursor
  }

  public var variables: GraphQLMap? {
    return ["firstNumberOfMovies": firstNumberOfMovies, "endCursor": endCursor]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("movies", type: .nonNull(.object(Movie.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(movies: Movie) {
      self.init(unsafeResultMap: ["__typename": "Query", "movies": movies.resultMap])
    }

    public var movies: Movie {
      get {
        return Movie(unsafeResultMap: resultMap["movies"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "movies")
      }
    }

    public struct Movie: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Movies"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("topRated", arguments: ["first": GraphQLVariable("firstNumberOfMovies"), "after": GraphQLVariable("endCursor")], type: .nonNull(.object(TopRated.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(topRated: TopRated) {
        self.init(unsafeResultMap: ["__typename": "Movies", "topRated": topRated.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var topRated: TopRated {
        get {
          return TopRated(unsafeResultMap: resultMap["topRated"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "topRated")
        }
      }

      public struct TopRated: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MovieConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
            GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
            GraphQLField("edges", type: .list(.object(Edge.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(pageInfo: PageInfo, totalCount: Int, edges: [Edge?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "MovieConnection", "pageInfo": pageInfo.resultMap, "totalCount": totalCount, "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var pageInfo: PageInfo {
          get {
            return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
          }
        }

        public var totalCount: Int {
          get {
            return resultMap["totalCount"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "totalCount")
          }
        }

        public var edges: [Edge?]? {
          get {
            return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
          }
        }

        public struct PageInfo: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["PageInfo"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
              GraphQLField("endCursor", type: .scalar(String.self)),
              GraphQLField("startCursor", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(hasNextPage: Bool, endCursor: String? = nil, startCursor: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "PageInfo", "hasNextPage": hasNextPage, "endCursor": endCursor, "startCursor": startCursor])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var hasNextPage: Bool {
            get {
              return resultMap["hasNextPage"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "hasNextPage")
            }
          }

          public var endCursor: String? {
            get {
              return resultMap["endCursor"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "endCursor")
            }
          }

          public var startCursor: String? {
            get {
              return resultMap["startCursor"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "startCursor")
            }
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["MovieEdge"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("node", type: .object(Node.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(node: Node? = nil) {
            self.init(unsafeResultMap: ["__typename": "MovieEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var node: Node? {
            get {
              return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "node")
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["MovieResult", "DetailedMovie", "Movie"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                GraphQLField("title", type: .nonNull(.scalar(String.self))),
                GraphQLField("overview", type: .nonNull(.scalar(String.self))),
                GraphQLField("rating", type: .nonNull(.scalar(Double.self))),
                GraphQLField("releaseDate", type: .scalar(String.self)),
                GraphQLField("details", type: .nonNull(.object(Detail.selections))),
                GraphQLField("poster", arguments: ["size": "W780"], type: .scalar(String.self)),
                GraphQLField("images", type: .nonNull(.object(Image.selections))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public static func makeMovieResult(id: Int, title: String, overview: String, rating: Double, releaseDate: String? = nil, details: Detail, poster: String? = nil, images: Image) -> Node {
              return Node(unsafeResultMap: ["__typename": "MovieResult", "id": id, "title": title, "overview": overview, "rating": rating, "releaseDate": releaseDate, "details": details.resultMap, "poster": poster, "images": images.resultMap])
            }

            public static func makeDetailedMovie(id: Int, title: String, overview: String, rating: Double, releaseDate: String? = nil, details: Detail, poster: String? = nil, images: Image) -> Node {
              return Node(unsafeResultMap: ["__typename": "DetailedMovie", "id": id, "title": title, "overview": overview, "rating": rating, "releaseDate": releaseDate, "details": details.resultMap, "poster": poster, "images": images.resultMap])
            }

            public static func makeMovie(id: Int, title: String, overview: String, rating: Double, releaseDate: String? = nil, details: Detail, poster: String? = nil, images: Image) -> Node {
              return Node(unsafeResultMap: ["__typename": "Movie", "id": id, "title": title, "overview": overview, "rating": rating, "releaseDate": releaseDate, "details": details.resultMap, "poster": poster, "images": images.resultMap])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: Int {
              get {
                return resultMap["id"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var title: String {
              get {
                return resultMap["title"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "title")
              }
            }

            public var overview: String {
              get {
                return resultMap["overview"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "overview")
              }
            }

            public var rating: Double {
              get {
                return resultMap["rating"]! as! Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "rating")
              }
            }

            public var releaseDate: String? {
              get {
                return resultMap["releaseDate"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "releaseDate")
              }
            }

            public var details: Detail {
              get {
                return Detail(unsafeResultMap: resultMap["details"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "details")
              }
            }

            public var poster: String? {
              get {
                return resultMap["poster"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "poster")
              }
            }

            public var images: Image {
              get {
                return Image(unsafeResultMap: resultMap["images"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "images")
              }
            }

            public struct Detail: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["DetailedMovie"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("imdbID", type: .nonNull(.scalar(String.self))),
                  GraphQLField("homepage", type: .scalar(String.self)),
                  GraphQLField("runtime", type: .nonNull(.scalar(Int.self))),
                  GraphQLField("budget", type: .scalar(Int.self)),
                  GraphQLField("similar", arguments: ["first": 10], type: .nonNull(.object(Similar.selections))),
                  GraphQLField("genres", type: .nonNull(.list(.nonNull(.object(Genre.selections))))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(imdbId: String, homepage: String? = nil, runtime: Int, budget: Int? = nil, similar: Similar, genres: [Genre]) {
                self.init(unsafeResultMap: ["__typename": "DetailedMovie", "imdbID": imdbId, "homepage": homepage, "runtime": runtime, "budget": budget, "similar": similar.resultMap, "genres": genres.map { (value: Genre) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var imdbId: String {
                get {
                  return resultMap["imdbID"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "imdbID")
                }
              }

              public var homepage: String? {
                get {
                  return resultMap["homepage"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "homepage")
                }
              }

              public var runtime: Int {
                get {
                  return resultMap["runtime"]! as! Int
                }
                set {
                  resultMap.updateValue(newValue, forKey: "runtime")
                }
              }

              public var budget: Int? {
                get {
                  return resultMap["budget"] as? Int
                }
                set {
                  resultMap.updateValue(newValue, forKey: "budget")
                }
              }

              public var similar: Similar {
                get {
                  return Similar(unsafeResultMap: resultMap["similar"]! as! ResultMap)
                }
                set {
                  resultMap.updateValue(newValue.resultMap, forKey: "similar")
                }
              }

              public var genres: [Genre] {
                get {
                  return (resultMap["genres"] as! [ResultMap]).map { (value: ResultMap) -> Genre in Genre(unsafeResultMap: value) }
                }
                set {
                  resultMap.updateValue(newValue.map { (value: Genre) -> ResultMap in value.resultMap }, forKey: "genres")
                }
              }

              public struct Similar: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["MovieConnection"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("edges", type: .list(.object(Edge.selections))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(edges: [Edge?]? = nil) {
                  self.init(unsafeResultMap: ["__typename": "MovieConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var edges: [Edge?]? {
                  get {
                    return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
                  }
                  set {
                    resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
                  }
                }

                public struct Edge: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["MovieEdge"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("node", type: .object(Node.selections)),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(node: Node? = nil) {
                    self.init(unsafeResultMap: ["__typename": "MovieEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  public var node: Node? {
                    get {
                      return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
                    }
                    set {
                      resultMap.updateValue(newValue?.resultMap, forKey: "node")
                    }
                  }

                  public struct Node: GraphQLSelectionSet {
                    public static let possibleTypes: [String] = ["MovieResult", "DetailedMovie", "Movie"]

                    public static var selections: [GraphQLSelection] {
                      return [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                        GraphQLField("details", type: .nonNull(.object(Detail.selections))),
                      ]
                    }

                    public private(set) var resultMap: ResultMap

                    public init(unsafeResultMap: ResultMap) {
                      self.resultMap = unsafeResultMap
                    }

                    public static func makeMovieResult(details: Detail) -> Node {
                      return Node(unsafeResultMap: ["__typename": "MovieResult", "details": details.resultMap])
                    }

                    public static func makeDetailedMovie(details: Detail) -> Node {
                      return Node(unsafeResultMap: ["__typename": "DetailedMovie", "details": details.resultMap])
                    }

                    public static func makeMovie(details: Detail) -> Node {
                      return Node(unsafeResultMap: ["__typename": "Movie", "details": details.resultMap])
                    }

                    public var __typename: String {
                      get {
                        return resultMap["__typename"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                      }
                    }

                    public var details: Detail {
                      get {
                        return Detail(unsafeResultMap: resultMap["details"]! as! ResultMap)
                      }
                      set {
                        resultMap.updateValue(newValue.resultMap, forKey: "details")
                      }
                    }

                    public struct Detail: GraphQLSelectionSet {
                      public static let possibleTypes: [String] = ["DetailedMovie"]

                      public static var selections: [GraphQLSelection] {
                        return [
                          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                          GraphQLField("imdbID", type: .nonNull(.scalar(String.self))),
                        ]
                      }

                      public private(set) var resultMap: ResultMap

                      public init(unsafeResultMap: ResultMap) {
                        self.resultMap = unsafeResultMap
                      }

                      public init(imdbId: String) {
                        self.init(unsafeResultMap: ["__typename": "DetailedMovie", "imdbID": imdbId])
                      }

                      public var __typename: String {
                        get {
                          return resultMap["__typename"]! as! String
                        }
                        set {
                          resultMap.updateValue(newValue, forKey: "__typename")
                        }
                      }

                      public var imdbId: String {
                        get {
                          return resultMap["imdbID"]! as! String
                        }
                        set {
                          resultMap.updateValue(newValue, forKey: "imdbID")
                        }
                      }
                    }
                  }
                }
              }

              public struct Genre: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Genre"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("name", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(name: String) {
                  self.init(unsafeResultMap: ["__typename": "Genre", "name": name])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var name: String {
                  get {
                    return resultMap["name"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "name")
                  }
                }
              }
            }

            public struct Image: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["MediaImages"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("posters", type: .nonNull(.list(.nonNull(.object(Poster.selections))))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(posters: [Poster]) {
                self.init(unsafeResultMap: ["__typename": "MediaImages", "posters": posters.map { (value: Poster) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var posters: [Poster] {
                get {
                  return (resultMap["posters"] as! [ResultMap]).map { (value: ResultMap) -> Poster in Poster(unsafeResultMap: value) }
                }
                set {
                  resultMap.updateValue(newValue.map { (value: Poster) -> ResultMap in value.resultMap }, forKey: "posters")
                }
              }

              public struct Poster: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["PosterSizeDetailImage"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("image", arguments: ["size": "W780"], type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(image: String) {
                  self.init(unsafeResultMap: ["__typename": "PosterSizeDetailImage", "image": image])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var image: String {
                  get {
                    return resultMap["image"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "image")
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
