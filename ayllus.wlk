import habitantes.*
import imperio.*


// c1 = #{tareaA, tareaB}
// c2 = #{tareaB, tareaC}
// c3 = #{tareaF}


class Ayllus {
    const colcas = #{}   // Ex.: #{c1, c2 c3}

    //principales
    method mejorColcaPara(habitante) = colcas.max({c => c.cantDeRecursos(habitante)})

    method colcasSuavesPara(habitante) = colcas.filter({c => c.produceAlMenos200Recursos(habitante)})

    method tareasExigentesPara(habitante) = colcas.map({c => c.tareaMasExigentePara(habitante)}).asSet()
}

object colca {
    const tareas = #{}


    method cantDeRecursos(hab) = tareas.count({t => hab.recursosTotalesParaLaTarea(t)}) // Ex.: cX

    method produceAlMenos200Recursos(hab) = tareas.any({t => hab.recursosTotalesParaLaTarea(t) < 200})

    method tareaMasExigentePara(hab) = tareas.max({t => hab.recursosTotalesParaLaTarea(t)})
}