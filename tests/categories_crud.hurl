# 1. Create a new category and capture its ID
POST http://localhost:3000/categories
Content-Type: application/json
Prefer: return=representation
{
    "title": "Work",
    "color": "#ff0000"
}
HTTP 201
[Asserts]
jsonpath "$[0].id" exists
jsonpath "$[0].title" == "Work"
[Captures]
categoryId: jsonpath "$[0].id"

# 2. Get the newly created category by its captured ID
GET http://localhost:3000/categories?id=eq.{{categoryId}}
HTTP 200
[Asserts]
jsonpath "$" count == 1
jsonpath "$[0].id" == {{categoryId}}

# 3. Delete the category to clean up
DELETE http://localhost:3000/categories?id=eq.{{categoryId}}
HTTP 204
