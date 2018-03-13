# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ApiMantenimiento.Repo.insert!(%ApiMantenimiento.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


alias ApiMantenimiento.Repo
alias ApiMantenimiento.Empresa.Area
alias ApiMantenimiento.Empresa.Proyecto
alias ApiMantenimiento.Empresa.Maquina
alias ApiMantenimiento.Accounts.Usuario
alias ApiMantenimiento.Mantenimiento.Orden_trabajo

usuarios = [
  %Usuario{
    nombre: "Ariel Santos", 
    username: "arielldv", 
    email: "ariel.easc@gmail.com", 
    password: Comeonin.Pbkdf2.hashpwsalt("camoranesi16") , 
    numero_empleado: "A00001", 
    is_staff: true, 
    is_admin: true
  },
  %Usuario{
    nombre: "Monica Flores", 
    username: "moncicaflo", 
    email: "arzteek@gmail.com", 
    password: Comeonin.Pbkdf2.hashpwsalt("camoranesi16"), 
    numero_empleado: "A00002"
  }, 
  %Usuario{
    nombre: "Jonathan Duran", 
    username: "jonathan123", 
    email: "ariel.easc@hotmail.com", 
    password: Comeonin.Pbkdf2.hashpwsalt("camoranesi16"), 
    numero_empleado: "A00003"
  }, 
]

areas = [
  %Area{nombre: "Manifold-Automotriz"},
  %Area{nombre: "Microchanel"}
]

proyectos = [
  %Proyecto{
    nombre: "Manifold", 
    minutos_produccion_mes: 1900, 
    area_id: 1
  },
  %Proyecto{
    nombre: "Automotriz", 
    minutos_produccion_mes: 1900, 
    area_id: 1
  },
  %Proyecto{
    nombre: "Heat", 
    minutos_produccion_mes: 1900, 
    area_id: 2
  },
  %Proyecto{
    nombre: "Soldadura", 
    minutos_produccion_mes: 1900, 
    area_id: 2
  },
]

maquinas = [
  %Maquina{
    nombre: "Maquina 1", 
    modelo: "Modelo 1", 
    serial: "Serial 1", 
    proyecto_id: 1, 
    estatus: 
    "fallo"
  },
  %Maquina{
    nombre: "Maquina 2", 
    modelo: "Modelo 2", 
    serial: "Serial 1", 
    proyecto_id: 1, 
    estatus: "fallo"
  },
  %Maquina{
    nombre: "Maquina 3", 
    modelo: "Modelo 3", 
    serial: "Serial 1", 
    proyecto_id: 1
  },
  %Maquina{
    nombre: "Maquina 4", 
    modelo: "Modelo 4", 
    serial: "Serial 1", 
    proyecto_id: 1
  },
  %Maquina{
    nombre: "Maquina 1", 
    modelo: "Modelo 1", 
    serial: "Serial 1", 
    proyecto_id: 2
  },
  %Maquina{
    nombre: "Maquina 2", 
    modelo: "Modelo 2", 
    serial: "Serial 1", 
    proyecto_id: 2
  },
  %Maquina{
    nombre: "Maquina 3", 
    modelo: "Modelo 3", 
    serial: "Serial 1", 
    proyecto_id: 2
  },
  %Maquina{
    nombre: "Maquina 4", 
    modelo: "Modelo 4", 
    serial: "Serial 1", 
    proyecto_id: 2
  },
  %Maquina{
    nombre: "Maquina 1", 
    modelo: "Modelo 1", 
    serial: "Serial 1", 
    proyecto_id: 3
  },
  %Maquina{
    nombre: "Maquina 2", 
    modelo: "Modelo 2", 
    serial: "Serial 1", 
    proyecto_id: 3
  },
  %Maquina{
    nombre: "Maquina 3", 
    modelo: "Modelo 3", 
    serial: "Serial 1", 
    proyecto_id: 3
  },
  %Maquina{
    nombre: "Maquina 4", 
    modelo: "Modelo 4", 
    serial: "Serial 1", 
    proyecto_id: 3
  },
  %Maquina{
    nombre: "Maquina 1", 
    modelo: "Modelo 1", 
    serial: "Serial 1", 
    proyecto_id: 4
  },
  %Maquina{
    nombre: "Maquina 2", 
    modelo: "Modelo 2", 
    serial: "Serial 1", 
    proyecto_id: 4
  },
  %Maquina{
    nombre: "Maquina 3", 
    modelo: "Modelo 3", 
    serial: "Serial 1",
    proyecto_id: 4
  },
  %Maquina{
    nombre: "Maquina 4",
    modelo: "Modelo 4", 
    serial: "Serial 1", 
    proyecto_id: 4
  },
]

ordenes_trabajo = [
  %Orden_trabajo{
    numero_orden: 1223,
    fecha_peticion: Timex.now,
    tipo_orden: "correctivo",
    descripcion: "La maquina se paro de la nada alv",
    numero_empleado: "A00002",
    maquina_id: 1,
    proyecto_id: 1,
  },

  %Orden_trabajo{
    numero_orden: 1223,
    fecha_peticion: Timex.now,
    tipo_orden: "correctivo",
    descripcion: "Otra maquina se paro de la nada alv",
    numero_empleado: "A00002",
    maquina_id: 2,
    proyecto_id: 1,
  },

  %Orden_trabajo{
    numero_orden: 1223,
    fecha_peticion: Timex.now,
    tipo_orden: "mejora",
    descripcion: "Una pecera para esta maquina",
    numero_empleado: "A00002",
    maquina_id: 5,
    proyecto_id: 2,
  },
]

Enum.each(usuarios, fn usuario ->
  Repo.insert(usuario)
end)

Enum.each(areas, fn area ->
  Repo.insert(area)
end)

Enum.each(proyectos, fn proyecto ->
  Repo.insert(proyecto)
end)

Enum.each(maquinas, fn maquina ->
  Repo.insert(maquina)
end)

Enum.each(ordenes_trabajo, fn orden_trabajo ->
  Repo.insert(orden_trabajo)
end)