import { View, Text, StyleSheet, ScrollView } from 'react-native';
import { ExerciseCard } from '../src/components/ExerciseCard';
import { RestTimer } from '../src/components/RestTimer';

export default function HomeScreen() {
  return (
    <ScrollView style={styles.container} contentContainerStyle={styles.content}>
      <Text style={styles.title}>Gym Tracker</Text>
      <Text style={styles.subtitle}>Welcome back. Ready to train?</Text>
      <View style={{ height: 16 }} />
      <RestTimer />
      <View style={{ height: 16 }} />
      <Text style={styles.section}>Recent exercises</Text>
      <ExerciseCard title="Barbell Bench Press" subtitle="Chest, Triceps" />
      <ExerciseCard title="Back Squat" subtitle="Quads, Glutes" />
      <ExerciseCard title="Deadlift" subtitle="Posterior chain" />
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: '#0B0F13' },
  content: { padding: 20, paddingTop: 64 },
  title: { color: '#FFFFFF', fontSize: 28, fontWeight: '700', marginBottom: 6 },
  subtitle: { color: '#9CA3AF', fontSize: 16 },
  section: { color: '#FFFFFF', fontSize: 18, fontWeight: '700', marginBottom: 10 },
});

