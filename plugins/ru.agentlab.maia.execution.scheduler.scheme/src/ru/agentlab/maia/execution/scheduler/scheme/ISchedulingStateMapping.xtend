package ru.agentlab.maia.execution.scheduler.scheme

import ru.agentlab.maia.context.IMaiaContext

interface ISchedulingStateMapping {

	def void put(ISchedulingState state, IMaiaContext context)

	def IMaiaContext get(ISchedulingState state)

	/** 
	 * Add a behaviour at the end of the behaviours queue. This can never change
	 * the index of the current behaviour. If the behaviours queue was empty
	 * notifies the embedded thread of the owner agent that a behaviour is now
	 * available.
	 * @param behaviour
	 */
	def void add(IMaiaContext context, ISchedulingState state)

	/** 
	 * Moves a behaviour from the ready queue to the sleeping queue.
	 * @param behaviour
	 */
	def void block(IMaiaContext behaviour)

	def void blockAll()

	/** 
	 * Moves a behaviour from the sleeping queue to the ready queue.
	 * @param behaviour
	 */
	def void restart(IMaiaContext behaviour)

	/** 
	 * Restarts all behaviours. This method simply calls IBehaviour.restart() on
	 * every behaviour. The IBehaviour.restart() method then notifies the agent
	 * (with the Agent.notifyRestarted() method), causing Scheduler.restart() to
	 * be called (this also moves behaviours from the blocked queue to the ready
	 * queue --> we must copy all behaviours into a temporary buffer to avoid
	 * concurrent modification exceptions). Why not restarting only blocked
	 * behaviours? Some ready behaviour can be a ParallelIBehaviour with some of
	 * its children blocked. These children must be restarted too.
	 */
	def void restartAll()

	/** 
	 * Removes a specified behaviour from the scheduler
	 * @param behaviour
	 */
	def void remove(IMaiaContext behaviour)

	def void removeAll()

}