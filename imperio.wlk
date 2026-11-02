class Tarea{
    const property esfuerzo


    method cantRecursosQueProduce(tiempo) = 50 * (tiempo - self.desgaste(tiempo)) * esfuerzo

    method desgaste(tiempo) 

    //method esfuerzo()
}

class TareaDeSiembra inherits Tarea {
    override method desgaste(tiempo) = 1 + (1*self.horasPorJornada())

    method horasPorJornada()
}

class SiembraEnElValle inherits TareaDeSiembra {
    const esMesDeLLuvia = false


    override method horasPorJornada() = if (esMesDeLLuvia){8} else {0}
}

//object estacion {
//    
//}

class SiembraEnTerrazas inherits TareaDeSiembra {
    override method horasPorJornada() = 6

    override method cantRecursosQueProduce(tiempo) = 3*super(tiempo)
}

class TareaDeMensajeria inherits Tarea {
    override method esfuerzo() = 1.4

    override method desgaste(tiempo) = tiempo/4
}

class TareaDeMensajeImperial inherits TareaDeMensajeria {
    override method esfuerzo() = 1.8

    override method desgaste(tiempo) = 1.min(2-)
}