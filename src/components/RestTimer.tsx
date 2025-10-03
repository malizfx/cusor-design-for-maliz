import { useEffect, useMemo, useState } from 'react';
import { View, Text, StyleSheet, Pressable } from 'react-native';
import { colors } from '../theme/colors';

function format(seconds: number) {
  const m = Math.floor(seconds / 60).toString().padStart(2, '0');
  const s = Math.floor(seconds % 60).toString().padStart(2, '0');
  return `${m}:${s}`;
}

export function RestTimer({ defaultSeconds = 120 }: { defaultSeconds?: number }) {
  const [secondsLeft, setSecondsLeft] = useState(defaultSeconds);
  const [running, setRunning] = useState(false);

  useEffect(() => {
    if (!running) return;
    const id = setInterval(() => {
      setSecondsLeft((s) => (s > 0 ? s - 1 : 0));
    }, 1000);
    return () => clearInterval(id);
  }, [running]);

  const isFinished = useMemo(() => secondsLeft === 0, [secondsLeft]);

  return (
    <View style={styles.container}>
      <Text style={styles.time}>{format(secondsLeft)}</Text>
      <View style={styles.actions}>
        <Pressable style={styles.button} onPress={() => setRunning((r) => !r)}>
          <Text style={styles.buttonText}>{running ? 'Pause' : 'Start'}</Text>
        </Pressable>
        <Pressable style={[styles.button, styles.secondary]} onPress={() => { setRunning(false); setSecondsLeft(defaultSeconds); }}>
          <Text style={styles.secondaryText}>Reset</Text>
        </Pressable>
      </View>
      {isFinished && <Text style={styles.done}>Rest complete</Text>}
    </View>
  );
}

const styles = StyleSheet.create({
  container: { backgroundColor: colors.surface, borderColor: colors.surfaceBorder, borderWidth: 1, borderRadius: 12, padding: 12, alignItems: 'center' },
  time: { color: colors.text, fontSize: 28, fontWeight: '800' },
  actions: { flexDirection: 'row', gap: 10, marginTop: 10 },
  button: { backgroundColor: colors.primary, paddingVertical: 8, paddingHorizontal: 14, borderRadius: 10 },
  buttonText: { color: colors.primaryText, fontWeight: '800' },
  secondary: { backgroundColor: colors.surface, borderWidth: 1, borderColor: colors.surfaceBorder },
  secondaryText: { color: colors.text },
  done: { marginTop: 8, color: colors.textMuted },
});

