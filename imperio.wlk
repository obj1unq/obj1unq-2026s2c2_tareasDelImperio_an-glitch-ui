class Tarea{
    const property esfuerzo


    method cantRecursosQueProduce(tiempo) = 50 * (tiempo - self.desgaste(tiempo)) * esfuerzo

    method desgaste(tiempo) 

    //method esfuerzo()
}

class TareaDeSiembra inherits Tarea { // 0.max(1+self.horasPorJornada())
    //el desgaste es 1 si la jornada es normal y se le suma 1 por cada hora extra. 
    override method desgaste(tiempo) = 1 + (1*self.horasPorJornada())

    method horasPorJornada()
}

class SiembraEnElValle inherits TareaDeSiembra {
    //const esMesDeLLuvia = false     // ...
    const property tipoDeEstacion = estacion        //cuando se le quiera cambiar el tipo de estacion, acá no se lo cambia, sino al propio objeto que define el tipo de estación...


    //override method horasPorJornada() = if (esMesDeLLuvia){8} else {0}
    override method horasPorJornada() = tipoDeEstacion.valorPorSiembra()
}

object estacion {
    var property tipoDeMes = mesesDeSequia
    const property valorPorSiembra = tipoDeMes.valor()
}

object mesesDeLLuvia {
    //const meses = []      // ----> diciembre a junio
    const property valor = 0
}

object mesesDeSequia {
    //const meses = []      // ----> julio a noviembre(?
    const property valor = 8
}

class SiembraEnTerrazas inherits TareaDeSiembra {
    override method horasPorJornada() = 6

    override method cantRecursosQueProduce(tiempo) = 3*super(tiempo)
}

class TareaDeMensajeria inherits Tarea {
    //var valorPorEsfuerzo 


    override method esfuerzo() = 1.4

    override method desgaste(tiempo) = tiempo/4
}

class TareaDeMensajeImperial inherits TareaDeMensajeria {
    override method esfuerzo() = 1.8

    //override method desgaste(tiempo) = 1.min(2-(tiempo/4))
    override method desgaste(tiempo) = 1.min(2-super(tiempo))
}