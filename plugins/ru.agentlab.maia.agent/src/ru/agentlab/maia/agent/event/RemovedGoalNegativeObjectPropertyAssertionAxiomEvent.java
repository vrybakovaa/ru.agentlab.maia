package ru.agentlab.maia.agent.event;

import org.semanticweb.owlapi.model.OWLNegativeObjectPropertyAssertionAxiom;

<<<<<<< HEAD
import ru.agentlab.maia.Event;
=======
import ru.agentlab.maia.agent.Event;
>>>>>>> refs/remotes/origin/feature/#32-beliefbase-centric

public class RemovedGoalNegativeObjectPropertyAssertionAxiomEvent
		extends Event<OWLNegativeObjectPropertyAssertionAxiom> {

	public RemovedGoalNegativeObjectPropertyAssertionAxiomEvent(OWLNegativeObjectPropertyAssertionAxiom payload) {
		super(payload);
	}

}
