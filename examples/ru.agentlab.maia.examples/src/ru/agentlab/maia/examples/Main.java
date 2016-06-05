package ru.agentlab.maia.examples;

import java.util.concurrent.ForkJoinPool;

import ru.agentlab.maia.IAgent;
import ru.agentlab.maia.IContainer;
import ru.agentlab.maia.container.Container;
import ru.agentlab.maia.exception.ContainerException;
import ru.agentlab.maia.exception.InjectorException;
import ru.agentlab.maia.exception.ResolveException;

public class Main {

	public static void main(String[] args) throws InjectorException, ContainerException, ResolveException {
		IContainer container = new Container();
		container.put(ForkJoinPool.class, ForkJoinPool.commonPool());
		container.put(String.class, "TEST");
		IAgent agent = new ru.agentlab.maia.agent.Agent();
		agent.deployTo(container);
		agent.addRole(Example.class);
	}

}