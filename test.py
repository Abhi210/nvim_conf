import numpy as np
import matplotlib.pyplot as plt


a = np.random.normal(size=(3, 3))

b = np.random.uniform(size=(3, 3))

print(a @ b)

print("Program Completed in Nvim")

print(np.add(a, b))

print("Program completed with success")

print("Adding the identity matrix to the product of a and b above")

print(np.eye(3) + a @ b)

print("Program completed with success")

print("Creating a symmetric and antisymmetric matrix now")

sym = (a @ b + b @ a) / 2
anti = (a @ b - b @ a) / 2

print("Adding a random gaussian matrix to the above created matrices")

asym = np.random.normal(0.0, 1.0, size=(3, 3))
aasym = np.random.uniform(low=-1.0, high=1.0, size=(3, 3))

print("Symmetric matrix")
print(asym)

print("Asymmetric Matrix")

print(aasym)

print("Program completed")


print("Checking Neovim after modifying in mason-lspconfig.lua")

ran = np.min(sym)
print(ran, aasym.min(), np.max(aasym))

print("Checking autocompletions")

print("Autopair working", sep="b")

print(asym.min())

print("Checking new Autopairs")

print("The next line is comment. So won't print it")

#! Print This is comment

print("some random array")
print(np.random.uniform(0.0, 1.0))

# print("This is going to be comment")
# TODO: print("This is another comment")

# HACK: print("This is another comment")


print("Deleted a formatter for LUA")

mat = np.sin(np.random.uniform(0.0, 1.0, (3, 3)))

print(mat)

# FIX: Done


print("DOne more changes to treesitter")

a = np.linspace(0.0, 2 * np.pi, 1000)

b = np.random.normal(0.0, 1.0, size=1000)

plt.plot(a)
plt.show()

plt.plot(a + b)
plt.show()

c= np.random.normal(0.,1.,size=(3,3))

d= np.random.uniform(0.,1.,size=(3,3))
print("Done")
print("Thank You ")

print("Added some more configuration to nvim")

# This is going to be comment using which-key hints
