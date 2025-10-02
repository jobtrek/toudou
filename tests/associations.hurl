# === SETUP ===
# 1. Create a todo for the test
POST http://localhost:3000/todos
Content-Type: application/json
Prefer: return=representation
{"title": "Todo for association test"}
HTTP 201
[Captures]
todoId: jsonpath "$[0].id"

# 2. Create a category for the test
POST http://localhost:3000/categories
Content-Type: application/json
Prefer: return=representation
{"title": "High Priority", "color": "#ffdd00"}
HTTP 201
[Captures]
categoryId: jsonpath "$[0].id"


# === TEST ASSOCIATION ===
# 3. Associate the todo and category by posting to the join table
POST http://localhost:3000/categories_todos
Content-Type: application/json
Prefer: return=representation
{
    "todo_id": {{todoId}},
    "category_id": {{categoryId}}
}
HTTP 201

# 4. Verify the association exists
GET http://localhost:3000/categories_todos?todo_id=eq.{{todoId}}&category_id=eq.{{categoryId}}
HTTP 200
[Asserts]
jsonpath "$" count == 1
jsonpath "$[0].todo_id" == {{todoId}}
jsonpath "$[0].category_id" == {{categoryId}}


# === TEST DISASSOCIATION ===
# 5. Disassociate the todo and category
DELETE http://localhost:3000/categories_todos?todo_id=eq.{{todoId}}&category_id=eq.{{categoryId}}
HTTP 204

# 6. Verify the association is gone
GET http://localhost:3000/categories_todos?todo_id=eq.{{todoId}}&category_id=eq.{{categoryId}}
HTTP 200
[Asserts]
jsonpath "$" count == 0


# === CLEANUP ===
# 7. Delete the test todo
DELETE http://localhost:3000/todos?id=eq.{{todoId}}
HTTP 204

# 8. Delete the test category
DELETE http://localhost:3000/categories?id=eq.{{categoryId}}
HTTP 204
