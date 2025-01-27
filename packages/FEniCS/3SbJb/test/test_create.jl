
#this file includes the creation of the various julian meshes, returning true if all of
#them are creates succesfully with no errors

using FEniCS
using PyCall
@pyimport fenics


test_triangle = UnitTriangleMesh()
#test_tetrahedron = UnitTetrahedronMesh() # deprecated? https://fenicsproject.org/docs/dolfin/2019.1.0/python/_autogenerated/dolfin.cpp.generation.html
test_interval = UnitIntervalMesh(10)
test_square = UnitSquareMesh(10,10,"crossed")
test_cube = UnitCubeMesh(10,10,10)
test_box = BoxMesh(Point([0.0,0.0,0.0]),Point([1.0,1.0,1.0]),10,10,10)
test_rectangle = RectangleMesh(Point([0.0, 0.0]), Point([10.0, 4.0]), 10, 10)
test_copy  = Mesh(test_square)
test_file = Mesh("./dolphin.xml")

#the below functions simply check the creation of the objects,
#without (currently) verifying values
x1 = cell_orientations(test_square)
x2 = cells(test_square)
x3 = hmin(test_square)
x4 = hmax(test_square)
x5 = coordinates(test_square)
x6 = data(test_square)
x7 = domains(test_square)
x8 = geometry(test_square)
x9 = num_cells(test_square)
x10 = num_edges(test_square)
x11 = num_entities(test_square,1)
x12 = num_faces(test_square)
x13 = num_facets(test_square)
x14 = num_vertices(test_square)
x15 = bounding_box_tree(test_square)
x16 = init(test_square)
x17 = init(test_square,1)
x18 = topology(test_square)
x19 = rmax(test_square)
x20 = rmin(test_square)
x21 = ufl_id(test_square)
x22 = ufl_domain(test_square)


try
  pyimport("mshr")
  circle1 = Circle(Point([0.0, 0.0]),3)
  circle2 = Circle(Point([0.0, 0.0]),4)
  rectangle = Rectangle(Point([0.0, 0.0]),Point([1.0, 1.0]))
  box = Box(Point([0.0, 0.0, 0.0]),Point([1.0, 1.0,1.0]))
  cone = Cone(Point([0.0,0.0,1.0]),Point([0.0, 0.0, 0.0]),3,50)
  sphere = Sphere(Point([0.0, 0.0, 0.0]),3)
  mesh1 = generate_mesh(circle1,64)
  mesh2= generate_mesh(circle2,64)
  circle3 = circle1+circle2
  circle4 = circle2-circle1
  circle5 = circle1*circle2
  mesh3 = generate_mesh(circle3,64)
  mesh4 = generate_mesh(circle4,64)
  union = CSGUnion(circle1,circle2)
  intersection = CSGIntersection(circle1,circle2)
  difference = CSGDifference(circle1,circle2)
  scaling = CSGScaling(circle1,2)
  rotation_1 = CSGRotation(rectangle,45)
  rotation_2 = CSGRotation(rectangle,Point([11.0, 111.0]),45)
  rotation_3 = CSGRotation(sphere,Point([1.0, 1.0]),Point([1.0, 2.0]),45)
  translation = CSGTranslation(rectangle,Point([2.0,2.0]))
  x = Extrude2D(union,0.2)
catch ee
 print("mshr has not been included, so it has not been tested")
end

list_lu_solver_methods()

list_krylov_solver_methods()

list_krylov_solver_preconditioners()

list_linear_solver_methods()

info_NonLinearVariationalSolver()

info_LinearVariatonalSolver()

true
