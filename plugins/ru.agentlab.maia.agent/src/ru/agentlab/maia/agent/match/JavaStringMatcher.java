package ru.agentlab.maia.agent.match;

import java.util.Map;

import ru.agentlab.maia.IMatcher;

public class JavaStringMatcher implements IMatcher<String> {

	String value;

	public JavaStringMatcher(String clazz) {
		this.value = clazz;
	}

	@Override
	public boolean match(String string, Map<String, Object> map) {
		return string.equals(value);
	}

	@Override
	public Class<String> getType() {
		return String.class;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj == null) {
			return false;
		}
		if (obj == this) {
			return true;
		}
		if (obj instanceof JavaStringMatcher) {
			JavaStringMatcher other = (JavaStringMatcher) obj;
			boolean result = value.equals(other.value);
			return result;
		} else {
			return false;
		}
	}

	@Override
	public int hashCode() {
		return value.hashCode();
	}

	@Override
	public String toString() {
		return "JavaStringMatcher(" + value + ")";
	}

}