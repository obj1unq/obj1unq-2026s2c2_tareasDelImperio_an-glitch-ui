import imperio.*



class Persona{
    var property energia = 0


    method realizarTarea(tar) {
        self.validarSiPuedeRealizarLaTarea(tar)
        energia-=self.energiaQuePerderiaAlRealizarLaTarea(tar)
    }

    method energiaQuePerderiaAlRealizarLaTarea(t) = self.recursosTotalesParaLaTarea(t)/self.indiceDeResistencia()

    method validarSiPuedeRealizarLaTarea(tar) {
        if(!self.condicionParaLaTarea(tar)){
            self.error("Esta persona no puede realizar la tarea: "+tar+"...")
        }
    }

    method tiempoAEjercerUnaTarea()

    method indiceDeResistencia()

    method condicionParaLaTarea(tarea) = energia>=self.energiaQuePerderiaAlRealizarLaTarea(tarea)    // nombre general para agregar x cantidad de condiciones

    

    method recursosTotalesParaLaTarea(tar) = tar.cantRecursosQueProduce(self.tiempoAEjercerUnaTarea())
}



class Campesino inherits Persona {
    const property horasPorTarea

    override method indiceDeResistencia() = 10

    override method tiempoAEjercerUnaTarea() = horasPorTarea
}

class Elite inherits Persona {
    override method indiceDeResistencia() = 12

    override method tiempoAEjercerUnaTarea() = 10

    override method energiaQuePerderiaAlRealizarLaTarea(tarea) = super(tarea) - 5

    override method condicionParaLaTarea(tarea) = super(tarea) && tarea.cantRecursosQueProduce(self.tiempoAEjercerUnaTarea()) > 500
}