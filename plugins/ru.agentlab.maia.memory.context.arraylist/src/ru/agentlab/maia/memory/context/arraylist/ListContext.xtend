package ru.agentlab.maia.memory.context.arraylist

import java.util.ArrayList
import java.util.HashSet
import java.util.LinkedList
import ru.agentlab.maia.memory.IMaiaContext
import ru.agentlab.maia.memory.context.AbstractContext
import javax.inject.Provider

/**
 * <p>{@link IMaiaContext} realization based on {@link LinkedList} for storing keys and values.</p>
 * 
 * <p>Main parameters:</p>
 * <ul>
 * <li><code>getLocal()</code> complexity: 			<b>O(SIZE)</b>;</li>
 * <li><code>setLocal()</code> complexity: 			<b>O(SIZE)</b>;</li>
 * <li><code>isContainsLocal()</code> complexity:	<b>O(SIZE)</b>;</li>
 * <li>memory usage: <b>O(8 * SIZE) bytes</b>;</li>
 * </ul>
 * <p>where SIZE - service count.</p>
 * <p>Empty context will allocate approximately <b>64 bytes</b>.</p>
 * 
 * <p><b>Important!</b> This realization does not retrieve services by it's subclass. Context
 * retrieve context only by identifier that was used while registration service on context.</p>
 * 
 * @see <a href='http://java-performance.info/memory-consumption-of-java-data-types-1/'>ArrayList memory consumption</a>
 * 
 * @author <a href='shishkindimon@gmail.com'>Shishkin Dmitriy</a> - Initial contribution.
 */
class ListContext extends AbstractContext {

	val protected ArrayList<String> keys = new ArrayList

	val protected ArrayList<Object> values = new ArrayList

	override synchronized doGetLocal(String name) {
		val index = keys.indexOf(name)
		if (index != -1) {
			return values.get(index)
		} else {
			return null
		}
	}

	override synchronized <T> doGetLocal(Class<T> clazz) {
		val index = keys.indexOf(clazz.name)
		try {
			if (index != -1) {
				return values.get(index) as T
			} else {
				return null
			}
		} catch (ClassCastException e) {
			return null
		}
	}

	override synchronized <T> doSetLocal(String name, T value) {
		val index = keys.indexOf(name)
		if (index != -1) {
			values.set(index, value)
		} else {
			keys.add(name)
			values.add(value)
			keys.trimToSize
			values.trimToSize
		}
	}

	override synchronized <T> doSetLocal(Class<T> clazz, T value) {
		val index = keys.indexOf(clazz.name)
		if (index != -1) {
			values.set(index, value)
		} else {
			keys.add(clazz.name)
			values.add(value)
			keys.trimToSize
			values.trimToSize
		}
	}

	override synchronized doRemoveLocal(String name) {
		val index = keys.indexOf(name)
		if (index != -1) {
			keys.remove(index)
			return values.remove(index)
		} else {
			return null
		}
	}

	override synchronized <T> doRemoveLocal(Class<T> clazz) {
		val index = keys.indexOf(clazz.name)
		if (index != -1) {
			keys.remove(index)
			return values.remove(index) as T
		} else {
			return null
		}
	}

	override synchronized doGetKeySet() {
		return new HashSet<String>(keys)
	}

	override synchronized isContainsLocal(String name) {
		return keys.indexOf(name) != -1
	}

	override synchronized isContainsLocal(Class<?> clazz) {
		return keys.indexOf(clazz.name) != -1
	}

	override synchronized <T> doSetLocal(String name, Provider<T> provider) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override synchronized <T> doSetLocal(Class<T> clazz, Provider<T> provider) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}