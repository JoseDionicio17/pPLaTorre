-- CRACIÓN DE LA BASE DE DATOS
create database pPlaTorre;
use pPlaTorre;

-- 1. Creación de la tabla 'roles'
CREATE TABLE roles (
    id_rol INT PRIMARY KEY AUTO_INCREMENT, -- Clave primaria, se incrementa automáticamente.
    nombre_rol VARCHAR(50) NOT NULL -- Nombre del rol (e.g., Administrador, Vendedor).
);

-- 2. Creación de la tabla 'usuarios'
CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT, -- Clave primaria, se incrementa automáticamente.
    nombre_usuario VARCHAR(100) NOT NULL, -- Nombre de usuario (único).
    contraseña VARCHAR(255) NOT NULL, -- Contraseña del usuario (se recomienda encriptar).
    nombre_completo VARCHAR(100) NOT NULL, -- Nombre completo del usuario.
    id_rol INT NOT NULL, -- Clave foránea que referencia a la tabla 'roles'.
    email VARCHAR(100), -- Correo electrónico del usuario (opcional).
    FOREIGN KEY (id_rol) REFERENCES roles(id_rol) -- Relación con la tabla 'roles'.
);

-- 3. Creación de la tabla 'productos'
CREATE TABLE productos (
    id_producto INT PRIMARY KEY AUTO_INCREMENT, -- Clave primaria, se incrementa automáticamente.
    nombre_producto VARCHAR(100) NOT NULL, -- Nombre del producto.
    descripcion_producto TEXT, -- Descripción del producto (opcional).
    precio DECIMAL(10, 2) NOT NULL, -- Precio del producto.
    stock INT NOT NULL, -- Cantidad de productos en inventario.
    categoria_producto VARCHAR(50) -- Categoría a la que pertenece el producto.
);

-- 4. Creación de la tabla 'ventas'
CREATE TABLE ventas (
    id_venta INT PRIMARY KEY AUTO_INCREMENT, -- Clave primaria, se incrementa automáticamente.
    fecha_venta DATETIME NOT NULL, -- Fecha y hora de la venta.
    total_venta DECIMAL(10, 2) NOT NULL, -- Monto total de la venta.
    id_usuario INT NOT NULL, -- Clave foránea que referencia al usuario que realizó la venta.
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) -- Relación con la tabla 'usuarios'.
);

-- 5. Creación de la tabla 'detalle_ventas'
CREATE TABLE detalle_ventas (
    id_detalle INT PRIMARY KEY AUTO_INCREMENT, -- Clave primaria, se incrementa automáticamente.
    id_venta INT NOT NULL, -- Clave foránea que referencia a la venta.
    id_producto INT NOT NULL, -- Clave foránea que referencia al producto vendido.
    cantidad INT NOT NULL, -- Cantidad del producto vendido.
    precio_unitario DECIMAL(10, 2) NOT NULL, -- Precio unitario del producto.
    subtotal DECIMAL(10, 2) NOT NULL, -- Subtotal (cantidad * precio_unitario).
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta), -- Relación con la tabla 'ventas'.
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto) -- Relación con la tabla 'productos'.
);

-- 6. Creación de la tabla 'clientes'
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT, -- Clave primaria, se incrementa automáticamente.
    nombre_cliente VARCHAR(100) NOT NULL, -- Nombre del cliente.
    direccion_cliente VARCHAR(255), -- Dirección del cliente (opcional).
    telefono_cliente VARCHAR(20) -- Teléfono del cliente (opcional).
);

-- 7. Creación de la tabla 'ventas_clientes'
CREATE TABLE ventas_clientes (
    id_venta_cliente INT PRIMARY KEY AUTO_INCREMENT, -- Clave primaria, se incrementa automáticamente.
    id_venta INT NOT NULL, -- Clave foránea que referencia a la venta.
    id_cliente INT NOT NULL, -- Clave foránea que referencia al cliente.
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta), -- Relación con la tabla 'ventas'.
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) -- Relación con la tabla 'clientes'.
);
