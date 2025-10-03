import { View, Text, StyleSheet, Pressable, ScrollView } from 'react-native';
import { ExerciseCard } from '../src/components/ExerciseCard';
import { SetRow } from '../src/components/SetRow';

export default function StartScreen() {
  return (
    <ScrollView style={styles.container} contentContainerStyle={{ paddingBottom: 40 }}>
      <Text style={styles.title}>Start Workout</Text>
      <Pressable style={styles.button}>
        <Text style={styles.buttonText}>Blank Session</Text>
      </Pressable>
      <Pressable style={styles.buttonSecondary}>
        <Text style={styles.buttonTextSecondary}>Choose Template</Text>
      </Pressable>

      <View style={{ height: 16 }} />
      <Text style={styles.section}>Exercises</Text>
      <ExerciseCard title="Barbell Bench Press" subtitle="3 x 5" />
      <SetRow index={1} weight={80} reps={5} rir={2} />
      <SetRow index={2} weight={80} reps={5} rir={2} />
      <SetRow index={3} weight={80} reps={5} rir={2} />

      <ExerciseCard title="Bent-Over Row" subtitle="3 x 8" />
      <SetRow index={1} weight={60} reps={8} rir={1} />
      <SetRow index={2} weight={60} reps={8} rir={1} />
      <SetRow index={3} weight={60} reps={8} rir={1} />
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: '#0B0F13', padding: 20, paddingTop: 64 },
  title: { color: '#FFFFFF', fontSize: 24, fontWeight: '700', marginBottom: 16 },
  button: { backgroundColor: '#4ADE80', paddingVertical: 14, borderRadius: 12, alignItems: 'center', marginBottom: 12 },
  buttonText: { color: '#052e16', fontWeight: '700', fontSize: 16 },
  buttonSecondary: { backgroundColor: '#111827', paddingVertical: 14, borderRadius: 12, alignItems: 'center', borderWidth: 1, borderColor: '#1F2937' },
  buttonTextSecondary: { color: '#E5E7EB', fontWeight: '600', fontSize: 16 },
  section: { color: '#FFFFFF', fontSize: 18, fontWeight: '700', marginBottom: 10, marginTop: 8 },
});

